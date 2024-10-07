resource "aws_kms_key" "rds_performance_insights_key" {
  description = "KMS key for RDS Performance Insights encryption"
  key_usage   = "ENCRYPT_DECRYPT"
  is_enabled  = true
}