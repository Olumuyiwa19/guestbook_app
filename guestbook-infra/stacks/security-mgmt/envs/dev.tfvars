# This file contains the environment-specific variables for the dev environment.
app_name       = "guestbook"
environment    = "dev"
region         = "us-west-2"
shared_profile = "Muyi-Admin"
vpc_id         = "vpc-0aa84c81ae23609fe"

web_ingress_rules = [
  {
    description = "Allow HTTP"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
  },
  {
    description = "Allow HTTPS"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
  }
]
web_egress_rules = [
  {
    description         = "Allow DB traffic"
    from_port           = 3306
    to_port             = 3306
    protocol            = "tcp"
    rds_security_groups = ["sg-028a57df8e40f258b"]
    cidr_blocks         = ["10.0.0.0/16"]
  }
]

rds_ingress_rules = [
  {
    description     = "Allow all inbound from web instances"
    from_port       = 3306
    to_port         = 3306
    protocol        = "tcp"
    security_groups = ["sg-0c63783555f0833aa"]
    cidr_blocks     = ["10.0.0.0/16"]
  }
]
rds_egress_rules = [
  {
    description = "Allow all outbound"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
]
