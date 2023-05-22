output "eip_public_ip" {
  value = aws_eip.my_eip.public_ip
}

output "eip_id" {
  value = aws_eip.my_eip.id
}

output "s3_bucket_id" {
  value = aws_s3_bucket.my_s3_bucket.id
}

output "s3_bucket_domain_name" {
  value = aws_s3_bucket.my_s3_bucket.bucket_domain_name
}


output "eip_details" {
  value = aws_eip.my_eip
}

output "s3_bucket_details" {
  value = aws_s3_bucket.my_s3_bucket
}
