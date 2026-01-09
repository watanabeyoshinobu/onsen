# ログを保存する場所（ロググループ）を作成
resource "aws_cloudwatch_log_group" "onsen_log_group" {
  name              = "/ecs/onsen-service"
  retention_in_days = 7
}