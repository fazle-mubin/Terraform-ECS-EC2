resource "aws_ecs_service" "ecs-service" {
  name            = "Terra-service"
  cluster         = aws_ecs_cluster.ecs-cluster.id
  task_definition = aws_ecs_task_definition.task-difinition.arn
  desired_count   = 3 //need to change according to the tasks we want to create. We also need to change the ec2 instance count according to the desired count
  launch_type     = "EC2"
}