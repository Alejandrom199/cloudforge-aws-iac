resource "aws_s3_bucket" "assets" {
  bucket = "${var.proyecto}-assets-${var.sufijo_unico}"

  tags = {
    Name      = "${var.proyecto}-assets"
    ManagedBy = "Terraform"
    Project   = var.proyecto
  }
}

# Versionado para proteger los assets
resource "aws_s3_bucket_versioning" "assets" {
  bucket = aws_s3_bucket.assets.id
  versioning_configuration {
    status = "Enabled"
  }
}

# Bloquear acceso publico (los assets son privados)
resource "aws_s3_bucket_public_access_block" "assets" {
  bucket = aws_s3_bucket.assets.id

  block_public_acls       = true
  block_public_policy      = true
  ignore_public_acls       = true
  restrict_public_buckets  = true
}