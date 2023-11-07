resource "aws_subnet" "public_subnet" {
count = length(var.PUBLIC_SUBNET_CIDR)
vpc_id     = aws_vpc.main.id
cidr_block = element(var.PUBLIC_SUBNET_CIDR, count.index)
availability_zone = element(var.AZ, count.index)
map_public_ip_on_launch = true
## will not give public ip when an instance is launched if map_ip is not enabled
tags = {
    Name = "roboshop-${var.ENV}-pub-subnet-${element(var.AZ, count.index)}"
}
}
  
resource "aws_subnet" "private_subnet" {
count = length(var.PRIVATE_SUBNET_CIDR)
vpc_id     = aws_vpc.main.id
cidr_block = element(var.PRIVATE_SUBNET_CIDR, count.index)
availability_zone = element(var.AZ, count.index)

tags = {
    Name = "roboshop-${var.ENV}-priv-subnet-${element(var.AZ, count.index)}"
}
}