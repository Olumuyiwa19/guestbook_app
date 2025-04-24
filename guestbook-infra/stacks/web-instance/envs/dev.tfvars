# This file contains the environment-specific variables for the dev environment.
app_name              = "guestbook"
environment           = "dev"
region                = "us-west-2"
shared_profile        = "Muyi-Admin"
vpc_id                = "vpc-0aa84c81ae23609fe"
instance_profile      = "guestbook-app-ec2-instance-profile"
instance_type         = "t2.micro"
db_security_group_id  = "sg-028a57df8e40f258b"
ec2_security_group_id = "sg-0c63783555f0833aa"
subnet_ids            = ["subnet-063fb68b4865fe5ea", "subnet-0d0a1c8a2b2c0337e"]
