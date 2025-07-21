output "arn" {
  description = "arn"
  value = data.aws_iam_openid_connect_provider.open_id_connect.arn
  
}