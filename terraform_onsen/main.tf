terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0" # AWSプロバイダのバージョン（最新系を指定）
    }
  }
}

# AWSプロバイダの設定
provider "aws" {
  region = "ap-northeast-1" # 東京リージョン
}

# 1. VPC（自分専用のネットワーク空間）
resource "aws_vpc" "main" {
  cidr_block           = "10.0.0.0/16" # ネットワークの広さ
  enable_dns_hostnames = true          # DNS名を使えるようにする
  enable_dns_support   = true

  tags = {
    Name = "onsen-vpc" # AWSコンソールで見た時の名前
  }
}

# 2. インターネットゲートウェイ（外の世界との出入り口）
resource "aws_internet_gateway" "main" {
  vpc_id = aws_vpc.main.id  # さっき作ったVPCに取り付ける

  tags = {
    Name = "onsen-igw"
  }
}

# 3. パブリックサブネット（サーバーを置くための「部屋」）
resource "aws_subnet" "public_1a" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "10.0.1.0/24"       # 部屋の広さ
  availability_zone = "ap-northeast-1a"   # 東京の「A地区」に作る

  tags = {
    Name = "onsen-public-1a"
  }
}

# 4. ルートテーブル（道案内用の地図）
resource "aws_route_table" "public" {
  vpc_id = aws_vpc.main.id

  # 「どこへ行きたい場合(0.0.0.0/0)でも、ゲートウェイを通ってね」というルール
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.main.id
  }

  tags = {
    Name = "onsen-public-rt"
  }
}

# 5. ルートテーブルの紐付け（部屋に地図を貼る）
resource "aws_route_table_association" "public_1a" {
  subnet_id      = aws_subnet.public_1a.id
  route_table_id = aws_route_table.public.id
}

# 6. パブリックサブネット（もう一つの部屋：C地区）
resource "aws_subnet" "public_1c" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "10.0.2.0/24"       # 1a(10.0.1.0)とは違う住所にする
  availability_zone = "ap-northeast-1c"   # 東京の「C地区」に作る

  tags = {
    Name = "onsen-public-1c"
  }
}

# 7. ルートテーブルの紐付け（C地区の部屋にも同じ地図を貼る）
resource "aws_route_table_association" "public_1c" {
  subnet_id      = aws_subnet.public_1c.id
  route_table_id = aws_route_table.public.id # さっき作った地図(rt)を使い回す
}


# 8. セキュリティグループ（ALB用：受付係）
resource "aws_security_group" "alb" {
  name        = "onsen-alb-sg"
  description = "Allow HTTP traffic from the world"
  vpc_id      = aws_vpc.main.id

  # インバウンドルール（入ってくる通信）
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # 世界中どこからでもOK
  }

  # アウトバウンドルール（出ていく通信）
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1" # 全許可
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "onsen-alb-sg"
  }
}

# 9. セキュリティグループ（アプリ用：SP）
resource "aws_security_group" "app" {
  name        = "onsen-app-sg"
  description = "Allow traffic only from ALB"
  vpc_id      = aws_vpc.main.id

  # インバウンドルール（ALBからの通信だけ許可）
  ingress {
    from_port       = 80
    to_port         = 80
    protocol        = "tcp"
    security_groups = [aws_security_group.alb.id] # ←ここ重要！ALBのSGを指定
  }

  # アウトバウンドルール（全許可）
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "onsen-app-sg"
  }
}


# 10. ロードバランサー本体（司令塔）
resource "aws_lb" "main" {
  name               = "onsen-alb"
  internal           = false
  load_balancer_type = "application"

  # 関連付けるセキュリティグループ（受付係）
  security_groups = [aws_security_group.alb.id]

  # 配置するサブネット（A地区とC地区）
  subnets = [
    aws_subnet.public_1a.id,
    aws_subnet.public_1c.id
  ]

  tags = {
    Name = "onsen-alb"
  }
}

# 11. ターゲットグループ（転送先のリスト）
resource "aws_lb_target_group" "main" {
  name        = "onsen-tg"
  port        = 80
  protocol    = "HTTP"
  vpc_id      = aws_vpc.main.id
  target_type = "ip" # ECS Fargateを使う場合は必須の設定！

  # ヘルスチェック（サーバーが元気か定期的に確認する設定）
  health_check {
    path                = "/"
    healthy_threshold   = 2
    unhealthy_threshold = 2
    timeout             = 5
    interval            = 30
    matcher             = "200"
  }
}

# 12. リスナー（耳を澄ませて待ち受ける設定）
resource "aws_lb_listener" "http" {
  load_balancer_arn = aws_lb.main.arn
  port              = "80"
  protocol          = "HTTP"

  # デフォルトの動き：ターゲットグループへ転送
  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.main.arn
  }
}


# 13. ECRリポジトリ（Rails用：Terraform専用）
resource "aws_ecr_repository" "rails" {
  name                 = "onsen-rails-tf" # ←★名前を変更！既存の "onsen" と被らない
  image_tag_mutability = "MUTABLE"
  image_scanning_configuration {
    scan_on_push = true
  }
}

# 13-2. ECRリポジトリ（Nginx用：Terraform専用）
resource "aws_ecr_repository" "nginx" {
  name                 = "onsen-nginx-tf" # ←★名前を変更！
  image_tag_mutability = "MUTABLE"
  image_scanning_configuration {
    scan_on_push = true
  }
}


# 14. IAMロール（ECSがECRを使うための許可証）
resource "aws_iam_role" "ecs_task_execution_role" {
  name = "onsen-ecs-task-execution-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "ecs-tasks.amazonaws.com"
        }
      }
    ]
  })
}

# 15. IAMロールにポリシーを付与（公式の便利セットを貼り付ける）
resource "aws_iam_role_policy_attachment" "ecs_task_execution_role_policy" {
  role       = aws_iam_role.ecs_task_execution_role.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonECSTaskExecutionRolePolicy"
}


# 16. ECSクラスター（名前を変更して新規作成！）
resource "aws_ecs_cluster" "main" {
  name = "onsen-cluster-tf"  # ← 名前を「-tf」付きに変更！これで衝突しません。

  tags = {
    Name = "onsen-cluster-tf"
  }
}


# 17. タスク定義（本番仕様：Rails + Nginx）
resource "aws_ecs_task_definition" "main" {
  family                   = "onsen-task-tf" # ←★タスク名も "-tf" にして区別！
  requires_compatibilities = ["FARGATE"]
  network_mode             = "awsvpc"
  cpu                      = "512"
  memory                   = "1024"
  execution_role_arn       = aws_iam_role.ecs_task_execution_role.arn

  container_definitions = jsonencode([
    # 1つ目：Railsコンテナ
    {
      name      = "onsen-container"
      image     = "${aws_ecr_repository.rails.repository_url}:latest" # 新しい倉庫を参照
      essential = true
      portMappings = [
        {
          containerPort = 3000
          hostPort      = 3000
        }
      ]
    },
    # 2つ目：Nginxコンテナ
    {
      name      = "onsen-nginx-container"
      image     = "${aws_ecr_repository.nginx.repository_url}:latest" # 新しい倉庫を参照
      essential = true
      portMappings = [
        {
          containerPort = 80
          hostPort      = 80
        }
      ]
      dependsOn = [
        {
          containerName = "onsen-container"
          condition     = "START"
        }
      ]
    }
  ])
}


# 18. ECSサービス（タスクを起動・維持する部隊）
resource "aws_ecs_service" "main" {
  name            = "onsen-service"
  cluster         = aws_ecs_cluster.main.id
  task_definition = aws_ecs_task_definition.main.arn
  desired_count   = 1
  launch_type     = "FARGATE"

  network_configuration {
    subnets         = [aws_subnet.public_1a.id, aws_subnet.public_1c.id]
    security_groups = [aws_security_group.app.id]
    assign_public_ip = true
  }

  load_balancer {
    target_group_arn = aws_lb_target_group.main.arn
    container_name   = "onsen-nginx-container" # Nginxに向ける
    container_port   = 80
  }
}

# 19. おまけ：ALBのURLを表示する設定
output "alb_dns_name" {
  value = aws_lb.main.dns_name
}