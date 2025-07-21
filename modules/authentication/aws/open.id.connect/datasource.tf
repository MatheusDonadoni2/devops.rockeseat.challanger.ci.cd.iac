data "aws_iam_openid_connect_provider" "open_id_connect" {
  arn = aws_iam_openid_connect_provider.open_id_connect.arn
}