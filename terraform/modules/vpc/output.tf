output "vpc_id"{
    value = aws_vpc.web-vpc.id
}   

output "public_subnet1"{
    value = aws_subnet.Public-Subnet-1.id
}

# output "web_ip" {
#     value = aws_eip.web-eip1.address
# }