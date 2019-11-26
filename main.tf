# ---------------------------
# KMS Key
# ---------------------------
resource "aws_kms_key" "key" {
  count                   = var.create == true ? 1 : 0
  description             = var.description
  deletion_window_in_days = var.deletion_window_in_days
  enable_key_rotation     = var.enable_key_rotation
  policy                  = var.policy
  tags                    = var.tags
}
# ---------------------------
# KMS Key alias
# ---------------------------
resource "aws_kms_alias" "alias" {
  depends_on = [
    aws_kms_key.key,
  ]
  count         = var.create == true ? 1 : 0
  name          = "alias/${var.alias_name}"
  target_key_id = aws_kms_key.key[count.index].key_id
}
