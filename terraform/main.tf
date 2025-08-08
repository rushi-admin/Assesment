module "vpc" {
  source = "./modules/vpc-network"
  name = "assessment"
  vpc_cidr = var.vpc_cidr
  azs = ["ap-south-1a", "ap-south-1b", "ap-south-1c"]
  public_subnets = ["10.0.1.0/24","10.0.2.0/24","10.0.3.0/24"]
  private_subnets = ["10.0.11.0/24","10.0.12.0/24","10.0.13.0/24"]
}

module "servers" {
  source = "./modules/servers"
  name = "assessment"
  vpc_id = module.vpc.vpc_id
  public_subnet_ids = module.vpc.public_subnet_ids
  private_subnet_ids = module.vpc.private_subnet_ids
  ssh_cidr = "YOUR_IP/32"
  key_name = "YOUR_KEY_PAIR"
  ami = "ami-0c5204531f799e0c6" # example; replace with region-specific AMI
  instance_type = "t3.micro"
  public_count = 2
  private_count = 1
}
