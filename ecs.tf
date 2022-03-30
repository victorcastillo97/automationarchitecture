resource "aws_ecs_cluster" "cluster" {
  name = var.cluster_name
}

resource "aws_ecs_cluster_capacity_providers" "terraformtrain" {
  cluster_name = aws_ecs_cluster.cluster.name

  capacity_providers = [aws_ecs_capacity_provider.terraformtrain.name]

  default_capacity_provider_strategy {
    base              = 1
    weight            = 100
    capacity_provider = aws_ecs_capacity_provider.terraformtrain.name
  }
}

resource "aws_ecs_capacity_provider" "terraformtrain" {
  name = "terraformtrain"

  auto_scaling_group_provider {
    auto_scaling_group_arn = aws_autoscaling_group.autoscale_group.arn
  }
}

### Service
resource "aws_ecs_service" "service" {
  name            = var.ecs_service_name
  cluster         = aws_ecs_cluster.cluster.id
  task_definition = "${aws_ecs_task_definition.task.family}:${max("${aws_ecs_task_definition.task.revision}", "${data.aws_ecs_task_definition.task.revision}")}"
  desired_count   = 1
  load_balancer {
    target_group_arn = aws_lb_target_group.lb_target_group.arn
    container_name   = var.app_name
    container_port   = 4000
  }

}