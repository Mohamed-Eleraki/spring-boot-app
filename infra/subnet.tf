resource "aws_subnet" "pub_subnet_01" {
  vpc_id            = aws_vpc.vpc-01.id
  cidr_block        = "10.0.1.0/24"
  availability_zone = "us-east-1a"

  tags = {
    Name = "${var.owner}-us1-${var.environment}-pub_subnet_01"
  }
}

resource "aws_subnet" "pub_subnet_01" {
  vpc_id            = aws_vpc.vpc-01.id
  cidr_block        = "10.0.2.0/24"
  availability_zone = "us-east-1b"

  tags = {
    Name = "${var.owner}-us1-${var.environment}-pub_subnet_02"
  }
}

resource "aws_subnet" "prv_subnet_01" {
  vpc_id            = aws_vpc.vpc-01.id
  cidr_block        = "10.0.3.0/24"
  availability_zone = "us-east-1b"
    tags = {
      Name = "${var.owner}-us1-${var.environment}-prv_subnet_01"
    }
}

resource "aws_subnet" "prv_subnet_02" {
  vpc_id            = aws_vpc.vpc-01.id
  cidr_block        = "10.0.4.0/24"
  availability_zone = "us-east-1a"
    tags = {
      Name = "${var.owner}-us1-${var.environment}-prv_subnet_02"
    }
}