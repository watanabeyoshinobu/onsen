variable "aws_access_key" {
  description = "AWS Access Key ID"
  type        = string
  sensitive   = true
}

variable "aws_secret_key" {
  description = "AWS Secret Access Key"
  type        = string
  sensitive   = true
}

variable "secret_key_base" {
  description = "Rails secret key base"
  type        = string
  sensitive   = true
}

variable "db_password" {
  description = "The password for the database"
  type        = string
  sensitive   = true # これをつけるとログにパスワードが表示されなくなる
}

variable "db_username" {
  description = "The username for the database"
  type        = string
  default     = "admin" # デフォルト値を入れておけば tfvars に書かなくても動く
}

variable "google_maps_api_key" {
  description = "Google Maps API Key"
  type        = string
}