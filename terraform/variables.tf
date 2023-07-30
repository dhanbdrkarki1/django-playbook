#  VPC
variable "cidr_block" {
  default = "10.0.0.0/16"
  type    = string
}

variable "web_vpc_tenancy" {
  default = "default"
  type    = string
}

variable "public_sid1_block" {
  default     = "10.0.1.0/24"
  description = "Public subnet block"
  type        = string
}

variable "public_sid1_block_name" {
  default     = "public-subnet-1"
  description = "Name of Public subnet block"
  type        = string
}



# EC2
variable "ami" {
  default     = "ami-053b0d53c279acc90"
  description = "Name of the software image"
  type        = string
}

variable "type" {
  default     = "t3.medium"
  description = "Name of the instance type"
  type        = string
}

variable "az1" {
  default     = "us-east-1a"
  description = "Name of AZs"
  type        = string
}


variable "env" {
  default     = "Production"
  description = "Name of the environment"
  type        = string
}

variable "domain_name" {
  default     = "dhanbdrkarki.com"
  description = "Name of the domain"
  type        = string
}

variable "alternative_name" {

}

variable "record_name" {
  default     = "www"
  description = "sub domain name"
  type        = string
}