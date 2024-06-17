resource "aws_s3_bucket" "bucket" {
  bucket = var.bucket_name
}

resource "aws_s3_bucket_ownership_controls" "example" {
  bucket = aws_s3_bucket.bucket.id

  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}

# Rest of your resources referencing aws_s3_bucket.bucket.id
resource "aws_s3_bucket_public_access_block" "example" {
  bucket = aws_s3_bucket.bucket.id

  block_public_acls     = false
  block_public_policy  = false
  ignore_public_acls    = false
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
resource "aws_s3_object" "index" {
  bucket = aws_s3_bucket.bucket.id
  key    = "index.html"
  source = "index.html"

}
resource "aws_s3_object" "error" {
  bucket = aws_s3_bucket.bucket.id
  key    = "error.html"
  source = "error.html"

}

resource "aws_s3_object" "diwali" {
  bucket = aws_s3_bucket.bucket.id
  key    = "diwali.jpg"
  source = "diwali.jpg"
 
}
resource "aws_s3_object" "ganesh" {
  bucket = aws_s3_bucket.bucket.id
  key    = "ganesh.jpg"
  source = "ganesh.jpg"

}
resource "aws_s3_object" "holi" {
  bucket = aws_s3_bucket.bucket.id
  key    = "holi.jpg"
  source = "holi.jpg"
  
}
resource "aws_s3_object" "raksha" {
  bucket = aws_s3_bucket.bucket.id
  key    = "raksha.jpg"
  source =  "raksha.jpg"

}

resource "aws_s3_bucket_website_configuration" "website" {
  bucket = aws_s3_bucket.bucket.id

 index_document {
    suffix = "index.html"
  }
  error_document {
    key = "error.html"
  }


  depends_on = [ aws_s3_bucket_acl.example ]
}