# This file contains the environment-specific variables for the dev environment.
app_name             = "guestbook"
environment          = "dev"
region               = "us-west-2"
shared_profile       = "Muyi-Admin"
private_subnet_ids   = ["subnet-09c1df7e1fdd1f546", "subnet-093e5e754f59dec2a"]
security_group_id    = "sg-028a57df8e40f258b"
key_alias            = "alias/rds-kms-key"
db_engine            = "mysql"
db_engine_version    = "8.0.40"
db_instance_class    = "db.t3.micro"
db_allocated_storage = 20
db_username          = "admin"
db_port              = 3306
