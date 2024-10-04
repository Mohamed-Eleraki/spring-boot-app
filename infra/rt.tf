resource "aws_route_table" "rtable-pub" {
  vpc_id = aws_vpc.vpc-01.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = "${var.owner}-us1-${var.environment}-rt"
  }
}

resource "aws_route_table_association" "rtable_association_pub1" {
  subnet_id      = aws_subnet.pub_subnet_01.id
  route_table_id = aws_route_table.rtable-pub.id
}

resource "aws_route_table_association" "rtable_association_pub2" {
  subnet_id      = aws_subnet.pub_subnet_02.id
  route_table_id = aws_route_table.rtable-pub.id
}