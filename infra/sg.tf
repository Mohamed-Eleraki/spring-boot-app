resource "aws_security_group" "secgrp_RDS_01" {
  vpc_id = aws_vpc.vpc-01.id

  tags = {
    Name = "${var.owner}-us1-${var.environment}-RDS_secGrp"
  }
}

resource "aws_vpc_security_group_ingress_rule" "secgrp_RDS_01_ingress-01" {
  security_group_id = aws_security_group.secgrp_RDS_01.id
  #cidr_ipv4 = "0.0.0.0/0"
  cidr_ipv4   = "${aws_instance.bastion_host_01.private_ip}/32"
  from_port   = 5432
  to_port     = 5432
  ip_protocol = "tcp"
}

resource "aws_vpc_security_group_ingress_rule" "secgrp_RDS_01_ingress_02" {
  security_group_id = aws_security_group.secgrp_RDS_01.id
  #cidr_ipv4 = "0.0.0.0/0"
  cidr_ipv4   = "${aws_instance.bastion_host_02.private_ip}/32"
  from_port   = 5432
  to_port     = 5432
  ip_protocol = "tcp"
}

resource "aws_vpc_security_group_egress_rule" "secgrp_RDS_01_egress" {
  security_group_id = aws_security_group.secgrp_RDS_01.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1"
}

/*
# Deploy bastion host security group
resource "aws_security_group" "secgrp_bastion_02" {
  vpc_id = aws_vpc.vpc-01.id

  tags = {
    Name = "secgrp_bastion_01"
  }
}

resource "aws_vpc_security_group_ingress_rule" "secgrp_bastion_01_ingress" {
  security_group_id = aws_security_group.secgrp_bastion_02.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 22
  to_port           = 22
  ip_protocol       = "tcp"
}

resource "aws_vpc_security_group_egress_rule" "secgrp_bastion_01_egress" {
  security_group_id = aws_security_group.secgrp_bastion_02.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1"
}
*/