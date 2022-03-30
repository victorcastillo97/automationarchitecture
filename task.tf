

### Task definition
data "aws_ecs_task_definition" "task" {
  task_definition = aws_ecs_task_definition.task.family
}

resource "aws_ecs_task_definition" "task" {
  family = var.cluster_name
  network_mode  = "bridge"
  container_definitions = <<CONTAINER
  [
    {
      "memory": 512,
      "essential" :true,
      "image": "${var.ecr_image_uri}",
      "name": "${var.app_name}",
      "portMappings": [
        {
          "containerPort": 4000,
          "protocol": "tcp"
        }
      ],
      "environment": [
       {
          "name": "SECRET_KEY_BASE",
          "value": "${jsondecode(data.aws_secretsmanager_secret_version.secret_key_base.secret_string)["SECRET_KEY_BASE"]}"
        },
        {
          "name": "DATABASE_URL",
          "value": "ecto://${jsondecode(data.aws_secretsmanager_secret_version.db_user.secret_string)["db_user"]}:${jsondecode(data.aws_secretsmanager_secret_version.db_password.secret_string)["db_password"]}@localhost/descargar2"
        },
        {
          "name": "PORT",
          "value": "4000"
        },
        {
          "name": "HOST",
          "value": "localhost"
        }
      ]
    }
  ]
CONTAINER
}
