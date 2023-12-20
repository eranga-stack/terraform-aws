resource "aws_db_instance" "db_instance" {
  allocated_storage    = 20
  storage_type         = "standard"
  engine               = "mysql"
  engine_version       = "8.0"
  instance_class       = "db.t2.micro"
  name                 = var.db_name
  username             = var.db_user
  password             = var.db_pass
  skip_final_snapshot  = true
  vpc_security_group_ids = [aws_security_group.rds.id]
}
