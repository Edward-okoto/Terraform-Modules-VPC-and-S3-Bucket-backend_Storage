provider "aws" {
  region  = "us-east-1"
  profile = "Terraform-user" # Replace with your actual profile
}




module "vpc" {
  source             = "./modules/vpc"
  vpc_cidr_block     = "10.1.0.0/16"
  subnet_cidr_blocks = ["10.1.1.0/24", "10.1.2.0/24"]
}

output "vpc_id" {
  value = module.vpc.vpc_id
}



module "s3" {
  source = "./modules/s3"
}
