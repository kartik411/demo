module "ec2_instance" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "~> 3.0"

  name = "demo-instance"

  ami                    = "ami-0b828c1c5ac3f13ee"
  instance_type          = "t2.micro"
  key_name               = "terraform"
  monitoring             = true
  vpc_security_group_ids = [module.service_sg.security_group_id]
  subnet_id              = module.vpc.public_subnets[0]

  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}
