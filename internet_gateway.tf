resource "aws_internet_gateway" "igw_terraform" {
    vpc_id = aws_vpc.default.id
    tags = {
      "Name" = "internet_gateway_${var.vpc_name}"
    }
}