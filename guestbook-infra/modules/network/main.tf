# This module creates a VPC with public and private subnets, and a NAT gateway.
# It also creates an Elastic IP for the NAT gateway.

# Create Data Siurce for the availability zones
data "aws_availability_zones" "available" {
  state = "available"
}


resource "aws_vpc" "main" {
  cidr_block           = var.main_vpc_cidr
  enable_dns_hostnames = true
  enable_dns_support   = true
  tags = {
    Name = "${var.app_name}-vpc"
  Environment = var.environment }
}

#Create 2 public and private subnets in each availability zone
resource "aws_subnet" "public" {
  count                   = length(var.public_subnet_cidrs)
  vpc_id                  = aws_vpc.main.id
  cidr_block              = var.public_subnet_cidrs[count.index]
  availability_zone       = data.aws_availability_zones.available.names[count.index]
  map_public_ip_on_launch = true
  tags = {
    Name = "${var.app_name}-public-${count.index}"
  Environment = var.environment }
}

resource "aws_subnet" "private" {
  count             = length(var.private_subnet_cidrs)
  vpc_id            = aws_vpc.main.id
  cidr_block        = var.private_subnet_cidrs[count.index]
  availability_zone = data.aws_availability_zones.available.names[count.index]
  tags = {
    Name = "${var.app_name}-private-${count.index}"
  Environment = var.environment }
}

# External network access for the public subnets
resource "aws_internet_gateway" "main" {
  vpc_id = aws_vpc.main.id
  tags = {
    Name        = "${var.app_name}-main-igw"
    Environment = var.environment
  }
}

resource "aws_route_table" "public" {
  vpc_id = aws_vpc.main.id
  tags = {
    Name        = "${var.app_name}-public-route-table"
    Environment = var.environment
  }
}

resource "aws_route" "public_internet_access" {
  route_table_id         = aws_route_table.public.id
  destination_cidr_block = var.cidr_quad_zero
  gateway_id             = aws_internet_gateway.main.id
  depends_on             = [aws_internet_gateway.main]
}

resource "aws_route_table_association" "public_assoc" {
  count          = length(var.public_subnet_cidrs)
  subnet_id      = aws_subnet.public[count.index].id
  route_table_id = aws_route_table.public.id
}

# Internal network access for the private subnets

resource "aws_eip" "nat_gw_eip" {
  count = length(var.public_subnet_cidrs)
  tags = {
    Name        = "${var.app_name}-nat-eip-${count.index}"
    Environment = var.environment
  }
}

resource "aws_nat_gateway" "nat_gws" {
  count         = length(var.public_subnet_cidrs)
  allocation_id = aws_eip.nat_gw_eip[count.index].id
  subnet_id     = aws_subnet.public[count.index].id
  tags = {
    Name = "${var.app_name}-natgw-${count.index}"
  Environment = var.environment }
}

resource "aws_route_table" "private" {
  count  = length(aws_nat_gateway.nat_gws)
  vpc_id = aws_vpc.main.id

  depends_on = [aws_nat_gateway.nat_gws]

  tags = {
    Name        = "${var.app_name}-private-route-table-${count.index}"
    Environment = var.environment
  }
}

resource "aws_route" "private" {
  count                  = length(aws_route_table.private)
  route_table_id         = aws_route_table.private[count.index].id
  destination_cidr_block = var.cidr_quad_zero
  nat_gateway_id         = aws_nat_gateway.nat_gws[count.index].id

  depends_on = [aws_route_table.private]
}

resource "aws_route_table_association" "private_assoc" {
  count          = length(var.private_subnet_cidrs)
  subnet_id      = aws_subnet.private[count.index].id
  route_table_id = aws_route_table.private[count.index].id
}
