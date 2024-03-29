# creates peering between aws network and private network
resource "aws_vpc_peering_connection" "peer" {
  vpc_id      = var.DEFAULT_VPC_ID
  peer_vpc_id = aws_vpc.main.id
  auto_accept = true

   tags = {
    Name = "roboshop-AWS-peering"
  }
}