# elastic ip for NAT GW
# ensure EIP is provisioned first and then NAT gateway 

resource "aws_eip" "ngw_ip" {
vpc = true

  tags = {
    Name = "roboshop-${var.ENV}-ngw-eip"
  }

}


# creating a NAT Gateway and will be attached to public subnet

resource "aws_nat_gateway" "ngw" {
  allocation_id = aws_eip.ngw_ip.id
  subnet_id     = aws_subnet.public_subnet.*.id[0]
  # since there are two subnets it has to go and attach to the first [0]

  tags = {
    Name = "NAT-gw"
  }

  # To ensure proper ordering, it is recommended to add an explicit dependency
  # on the Internet Gateway and eip for the ngw.
  depends_on = [aws_internet_gateway.igw, aws_eip.ngw_ip ]
}