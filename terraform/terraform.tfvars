# common
env = "Dev"

# VPC
cidr_block             = "10.0.0.0/16"
public_sid1_block      = "10.0.1.0/24"
public_sid1_block_name = "public-subnet-1"
web_vpc_tenancy        = "default"


# ec2
ami  = "ami-053b0d53c279acc90"
type = "t3.medium"
az1  = "us-east-1a"

# Route53
domain_name      = "dhanbdrkarki.com"
alternative_name = "*.dhanbdrkarki.com"