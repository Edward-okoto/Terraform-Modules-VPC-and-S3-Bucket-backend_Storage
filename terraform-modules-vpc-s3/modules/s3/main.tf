


resource "aws_s3_bucket" "state_bucket" {
  bucket = "example7-s3-bucket-2025"

  tags = {
    Name = "TerraformStateBucket"
  }
}

resource "aws_s3_bucket_policy" "state_bucket_policy" {
  bucket = aws_s3_bucket.state_bucket.id

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Sid       = "AllowSpecificUserAccess"
        Effect    = "Allow"
        Action    = "s3:*"
        Resource  = [
          "${aws_s3_bucket.state_bucket.arn}/*",
          aws_s3_bucket.state_bucket.arn
        ]
        Principal = {
          AWS = "arn:aws:iam::491085391064:user/Terraform-user"
        }
      }
    ]
  })
}

