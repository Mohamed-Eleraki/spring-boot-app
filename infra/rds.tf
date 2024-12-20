resource "aws_db_subnet_group" "RDS_sub_group" {
  name       = "rds_subnet_group"
  subnet_ids = [aws_subnet.prv_subnet_01.id, aws_subnet.prv_subnet_02.id]

  tags = {
    Name = "${var.owner}-us1-${var.environment}-RDS_subGrp"
  }
}

resource "aws_db_instance" "rds_postgres_instance" {
  allocated_storage = 20
  engine            = "postgres"
  engine_version    = "15.4"
  instance_class    = "db.t3.micro"
  db_name           = "postgresql_database"
  username          = "postgres"
  #password = "postgres"
  manage_master_user_password = true
  db_subnet_group_name        = aws_db_subnet_group.RDS_sub_group.name
  vpc_security_group_ids      = [aws_security_group.secgrp_RDS_01.id]
  skip_final_snapshot         = true # whether or not AWS RDS creates a final snapshot of the database before it is deleted.
  publicly_accessible         = false
  storage_encrypted           = true
  multi_az                    = true
  backup_retention_period     = 7
  auto_minor_version_upgrade  = true  # default is true
  allow_major_version_upgrade = false # default is false
  copy_tags_to_snapshot       = true
  delete_automated_backups    = true # Auto delete backups after RDS deleted | default is true
  #enabled_cloudwatch_logs_exports = ["general", "error", "slowquery"]
  performance_insights_enabled   = true
  performance_insights_kms_key_id = aws_kms_key.rds_performance_insights_key.arn
  blue_green_update {                # ensuring the Updates applies by AWS applies via Blue/Green deployment
    enabled = true
  }
  tags = {
    Name = "${var.owner}-us1-${var.environment}-RDS-PSQL"
  }
}