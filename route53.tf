# associating the VPC to the private hosted zone

resource "aws_route53_zone_association" "VPC_assocaite" {
  zone_id = var.PRIVATE_HOSTED_ZONE_ID
  vpc_id = aws_vpc.main.id
}