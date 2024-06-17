resource "aws_s3_bucket" "bucket" {
  bucket = var.bucket_name

 
}


resource "aws_s3_bucket_ownership_controls" "example" {
  bucket = aws_s3_bucket.bucket.id

  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}
resource "aws_s3_bucket_public_access_block" "example" {
  bucket = aws_s3_bucket.bucket_name

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}

resource "aws_s3_bucket_acl" "example" {
  depends_on = [
    aws_s3_bucket_ownership_controls.example,
    aws_s3_bucket_public_access_block.example,
  ]

  bucket = aws_s3_bucket.bucket.id
  acl    = "public-read"
}

resource "aws_s3_bucket_object" "index" {
  bucket = aws_s3_bucket.bucket.id
  key    = "diwali.jpg"
  source = "diwali.jpg"
    acl    = "public-read"
}
resource "aws_s3_bucket_object" "index" {
  bucket = aws_s3_bucket.bucket.id
  key    = "ganesh.jpg"
  source = "ganesh.jpg"
    acl    = "public-read"
}
resource "aws_s3_bucket_object" "index" {
  bucket = aws_s3_bucket.bucket.id
  key    = "holi.jpg"
  source = "holi.jpg"
    acl    = "public-read"
}
resource "aws_s3_bucket_object" "index" {
  bucket = aws_s3_bucket.bucket.id
  key    = "raksha.jpg"
  source =  "raksha.jpg"
    acl    = "public-read"
}