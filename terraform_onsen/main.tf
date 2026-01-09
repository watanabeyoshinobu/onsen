terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0" # AWSプロバイダのバージョン
    }
  }
}

# AWSプロバイダの設定
provider "aws" {
  region = "ap-northeast-1" # 東京リージョン
}

# 1. VPC（自分専用のネットワーク空間）
resource "aws_vpc" "main" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = {
    Name = "onsen-vpc"
  }
}

# 2. インターネットゲートウェイ
resource "aws_internet_gateway" "main" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "onsen-igw"
  }
}

# 3. パブリックサブネット（1a）
resource "aws_subnet" "public_1a" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "10.0.1.0/24"
  availability_zone = "ap-northeast-1a"

  tags = {
    Name = "onsen-public-1a"
  }
}

# 4. ルートテーブル
resource "aws_route_table" "public" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.main.id
  }

  tags = {
    Name = "onsen-public-rt"
  }
}

# 5. ルートテーブル紐付け（1a）
resource "aws_route_table_association" "public_1a" {
  subnet_id      = aws_subnet.public_1a.id
  route_table_id = aws_route_table.public.id
}

# 6. パブリックサブネット（1c）
resource "aws_subnet" "public_1c" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "10.0.2.0/24"
  availability_zone = "ap-northeast-1c"

  tags = {
    Name = "onsen-public-1c"
  }
}

# 7. ルートテーブル紐付け（1c）
resource "aws_route_table_association" "public_1c" {
  subnet_id      = aws_subnet.public_1c.id
  route_table_id = aws_route_table.public.id
}

# 8. セキュリティグループ（ALB用）
resource "aws_security_group" "alb" {
  name        = "onsen-alb-sg"
  description = "Allow HTTP traffic from the world"
  vpc_id      = aws_vpc.main.id

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "onsen-alb-sg"
  }
}

# 9. セキュリティグループ（アプリ用）
resource "aws_security_group" "app" {
  name        = "onsen-app-sg"
  description = "Allow traffic only from ALB"
  vpc_id      = aws_vpc.main.id

  ingress {
    from_port       = 80
    to_port         = 80
    protocol        = "tcp"
    security_groups = [aws_security_group.alb.id]
  }

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

# 10. ロードバランサー（ALB）
resource "aws_lb" "main" {
  name               = "onsen-alb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.alb.id]
  subnets            = [aws_subnet.public_1a.id, aws_subnet.public_1c.id]

  tags = {
    Name = "onsen-alb"
  }
}

# 11. ターゲットグループ
resource "aws_lb_target_group" "main" {
  name        = "onsen-tg"
  port        = 80
  protocol    = "HTTP"
  vpc_id      = aws_vpc.main.id
  target_type = "ip"

  health_check {
    path                = "/"
    healthy_threshold   = 2
    unhealthy_threshold = 2
    timeout             = 5
    interval            = 30
    matcher             = "200"
  }
}

# 12. リスナー
resource "aws_lb_listener" "http" {
  load_balancer_arn = aws_lb.main.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.main.arn
  }
}

# 13. ECRリポジトリ（Rails）
resource "aws_ecr_repository" "rails" {
  name                 = "onsen-rails-tf"
  image_tag_mutability = "MUTABLE"
  image_scanning_configuration {
    scan_on_push = true
  }
}

# 13-2. ECRリポジトリ（Nginx）
resource "aws_ecr_repository" "nginx" {
  name                 = "onsen-nginx-tf"
  image_tag_mutability = "MUTABLE"
  image_scanning_configuration {
    scan_on_push = true
  }
}

# 14. IAMロール（タスク実行）
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

# 15. IAMポリシー付与
resource "aws_iam_role_policy_attachment" "ecs_task_execution_role_policy" {
  role       = aws_iam_role.ecs_task_execution_role.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonECSTaskExecutionRolePolicy"
}

# 16. ECSクラスター
resource "aws_ecs_cluster" "main" {
  name = "onsen-cluster-tf"

  tags = {
    Name = "onsen-cluster-tf"
  }
}


# 17. タスク定義（DB接続情報込み）
resource "aws_ecs_task_definition" "main" {
  family                   = "onsen-task-tf"
  requires_compatibilities = ["FARGATE"]
  network_mode             = "awsvpc"
  cpu                      = "512"
  memory                   = "1024"
  execution_role_arn       = aws_iam_role.ecs_task_execution_role.arn

  # ★重要：ここで「共有フォルダ」を作ります
  volume {
    name = "tmp-socket"
  }

  container_definitions = jsonencode([
    {
      name      = "onsen-container"
      image     = "${aws_ecr_repository.rails.repository_url}:latest"
      essential = true
      command = ["bundle", "exec", "puma", "-p", "3000"]
      portMappings = [
        {
          containerPort = 3000
          hostPort      = 3000
        }
      ],
      # ★★★ ここを修正・追記しました ★★★
      environment = [
        # 修正：DB_HOST → DB_HOSTNAME に変更（database.ymlに合わせるため）
        { name = "DB_HOSTNAME", value = aws_db_instance.main.address },
        { name = "DB_USERNAME", value = "admin" },
        { name = "DB_PASSWORD", value = "password1234" },
        { name = "DB_NAME",     value = "onsen_production" },
        { name = "RAILS_LOG_TO_STDOUT", value = "true" },
        { name = "RAILS_ENV",   value = "production" },
        { name = "SECRET_KEY_BASE", value = var.secret_key_base },
        { name = "AWS_ACCESS_KEY_ID",     value = var.aws_access_key },
        { name = "AWS_SECRET_ACCESS_KEY", value = var.aws_secret_key },
        { name = "AWS_REGION",            value = "ap-northeast-1" }
      ],
      # ★★★ ここまで ★★★

      # ★重要：Rails側でこのフォルダを使うよ！という設定
      mountPoints = [
        {
          sourceVolume  = "tmp-socket"
          containerPath = "/app/tmp/sockets"
        }
      ],
      logConfiguration = {
        logDriver = "awslogs"
        options = {
          "awslogs-group"         = "/ecs/onsen-service"
          "awslogs-region"        = "ap-northeast-1"
          "awslogs-stream-prefix" = "rails"
        }
      }
    },
    {
      name      = "onsen-nginx-container"
      image     = "${aws_ecr_repository.nginx.repository_url}:latest"
      essential = true
      portMappings = [
        {
          containerPort = 80
          hostPort      = 80
        }
      ],
      dependsOn = [
        {
          containerName = "onsen-container"
          condition     = "START"
        }
      ],
      # ★重要：Nginx側でも同じフォルダを見るよ！という設定
      mountPoints = [
        {
          sourceVolume  = "tmp-socket"
          containerPath = "/app/tmp/sockets"
        }
      ],
      logConfiguration = {
        logDriver = "awslogs"
        options = {
          "awslogs-group"         = "/ecs/onsen-service"
          "awslogs-region"        = "ap-northeast-1"
          "awslogs-stream-prefix" = "nginx"
        }
      }
    }
  ])
}

# 18. ECSサービス
resource "aws_ecs_service" "main" {
  name            = "onsen-service"
  cluster         = aws_ecs_cluster.main.id
  task_definition = aws_ecs_task_definition.main.arn
  desired_count   = 1
  launch_type     = "FARGATE"

  network_configuration {
    subnets          = [aws_subnet.public_1a.id, aws_subnet.public_1c.id]
    security_groups  = [aws_security_group.app.id]
    assign_public_ip = true
  }

  load_balancer {
    target_group_arn = aws_lb_target_group.main.arn
    container_name   = "onsen-nginx-container"
    container_port   = 80
  }
}

# 19. おまけ：ALBのURL出力
output "alb_dns_name" {
  value = aws_lb.main.dns_name
}


# 20. DB用セキュリティグループ（アプリ用より前に定義が必要なため移動）
resource "aws_security_group" "db" {
  name        = "onsen-db-sg"
  description = "Allow access from ECS App"
  vpc_id      = aws_vpc.main.id

  ingress {
    from_port       = 3306
    to_port         = 3306
    protocol        = "tcp"
    security_groups = [aws_security_group.app.id]
  }

  tags = {
    Name = "onsen-db-sg"
  }
}

# 21. DBサブネットグループ
resource "aws_db_subnet_group" "main" {
  name       = "onsen-db-subnet-group"
  subnet_ids = [aws_subnet.public_1a.id, aws_subnet.public_1c.id]

  tags = {
    Name = "onsen-db-subnet-group"
  }
}

# 22. データベース本体 (MySQL)
resource "aws_db_instance" "main" {
  allocated_storage      = 20
  storage_type           = "gp2"
  engine                 = "mysql"
  engine_version         = "8.0"
  instance_class         = "db.t3.micro"
  identifier             = "onsen-db"
  username               = "admin"
  password               = "password1234"
  parameter_group_name   = "default.mysql8.0"
  skip_final_snapshot    = true
  publicly_accessible    = true
  vpc_security_group_ids = [aws_security_group.db.id]
  db_subnet_group_name   = aws_db_subnet_group.main.name
  db_name                = "onsen_production"
}
