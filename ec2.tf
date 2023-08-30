resource "aws_instance" "fazle-EC2" {
  ami                         = "ami-0b11163bc5cc1a53b"//This is an ECS optimized ami. ECS optimized amis should be used.
  subnet_id                   = aws_subnet.fazle-subnet.id
  vpc_security_group_ids      = [aws_security_group.fazle_SG_EC2.id]
  instance_type               = "t2.micro"
  associate_public_ip_address = "true"
  iam_instance_profile        = aws_iam_instance_profile.ecs_role.name

  count = 3//This will depend on the number of desired tasks
  
  tags = {
    Name  = "Fazle-ec2"
    Owner = "Fazle"
  }

  user_data = file("agent.sh")//In the bash script the cluster is being recognized by the EC2

}