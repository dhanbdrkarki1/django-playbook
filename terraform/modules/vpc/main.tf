# Create a VPC
resource "aws_vpc" "web-vpc" {
  cidr_block       = var.web_vpc_cidr
  instance_tenancy = var.web_vpc_tenancy
  enable_dns_hostnames = true 
  enable_dns_support = true

  tags = {
    Name = "web-vpc"
  }
}
# Create Public Subnet 1
resource "aws_subnet" "Public-Subnet-1" {
  vpc_id     = aws_vpc.web-vpc.id
  cidr_block = var.public_sid1
  availability_zone = var.az1

  tags = {
    Name = var.public_sid1_name
  }
}

# Internet Gateway
resource "aws_internet_gateway" "web-igw" {
  vpc_id = aws_vpc.web-vpc.id

  tags = {
    Name = "internet-gateway"
  }
}

# # Elastic IP 1
# resource "aws_eip" "web-eip1" {
#   vpc               = true
#   depends_on        = [aws_internet_gateway.web-igw]
# }


# Public Route table 1
resource "aws_route_table" "rtb-public1" {
  vpc_id = aws_vpc.web-vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.web-igw.id
  }

  tags = {
    Name = "public-route-table-1"
  }
}


# Public Route Table 1 Association with Public Subnet
resource "aws_route_table_association" "public1-rtba" {
  subnet_id      = aws_subnet.Public-Subnet-1.id
  route_table_id = aws_route_table.rtb-public1.id
}



