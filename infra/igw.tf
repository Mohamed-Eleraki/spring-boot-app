resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.vpc-01.id

  tags = {
    Name = "${var.owner}-us1-${var.environment}-igw"
  }
}