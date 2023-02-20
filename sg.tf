module "service_sg" {
  source = "terraform-aws-modules/security-group/aws"

  name        = "demo_sg"
  description = "Security group for jenkins server machine"
  vpc_id      = module.vpc.vpc_id

  ingress_with_cidr_blocks = [
    {
      from_port   = 22
      to_port     = 65535
      protocol    = "tcp"
      cidr_blocks = "0.0.0.0/0"
    }
  ]
  egress_with_cidr_blocks = [
    {
      from_port   = 0
      to_port     = 0 
      protocol    = "-1"
      cidr_blocks = "0.0.0.0/0"
    }
  ]
}
