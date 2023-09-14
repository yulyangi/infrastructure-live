terraform {
  source = "git@github.com:yulyangi/infrastructure-modules.git//ec2?ref=main"
}

include "root" {
  path = find_in_parent_folders()
}

inputs = {
  vpc_id     = "vpc-0a5b10bf8cefc3874"
  subnet_id  = "subnet-0fa20d7f8eb606a1b"
  aws_eip_id = "eipalloc-0e58bea9e883827ba"
}
