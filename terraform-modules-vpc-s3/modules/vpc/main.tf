
variable "vpc_cidr_block" {
  default     = "10.0.0.0/16"
  description = "CIDR block for the VPC"
}

variable "subnet_cidr_blocks" {
  type        = list(string)
  default     = ["10.0.1.0/24", "10.0.2.0/24"]
  description = "List of subnet CIDR blocks"
}

resource "aws_vpc" "main_vpc" {
  cidr_block = var.vpc_cidr_block

  tags = {
    Name = "MainVPC"
  }
}

resource "aws_subnet" "main_subnet" {
  count      = length(var.subnet_cidr_blocks)
  vpc_id     = aws_vpc.main_vpc.id
  cidr_block = element(var.subnet_cidr_blocks, count.index)

  tags = {
    Name = "MainSubnet-${count.index}"
  }
}

output "vpc_id" {
  value = aws_vpc.main_vpc.id
}

