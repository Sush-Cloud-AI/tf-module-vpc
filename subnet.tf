resource "aws_subnet" "main" {
count = length(var.SUBNET_CIDR)
vpc_id     = aws_vpc.main.id
cidr_block = element(var.SUBNET_CIDR, count.index)
availability_zone = element(var.AZ, count.index)
  tags = {
    Name = "${var.ENV}-subnet-${element(var.AZ, count.index)}"
  }
}

## number of subnet to be created will be based on the nuber of SUBNET_CIDR
## logic: count the length of var and loop it using COUNT and length function