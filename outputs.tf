output "key" {
  description = "Output key root"
  value = aws_kms_key.key
}

output "arn" {
  description = "Output kms arn"
  value = aws_kms_key.arn
}
