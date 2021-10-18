resource "aws_ecs_task_definition" "ecs_docker_task" {
  family = "ecs_docker"
  container_definitions = jsonencode ({
    
      name      = "ecs_docker_container"
      image     = "ecs_docker_image"
      portMappings = [
        {
          containerPort = 8080
          hostPort      = 8080
        }
      ]
    })
}

resource "aws_ecs_service" "ecs_docker_service" {
  name            = "ecs_docker_service"
  task_definition = ecs_docker.ecs_docker_task
  desired_count   = 1

}
