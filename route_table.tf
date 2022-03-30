## SUBNET PUBLIC A
resource "aws_route_table" "route_public_a" {
  vpc_id = aws_vpc.default.id
  tags= {
      Name = "Public Route A"
  }
  route {
      cidr_block = "0.0.0.0/0"
      gateway_id = aws_internet_gateway.igw_terraform.id
  }
}

resource "aws_route_table_association" "route_subnet_public_a" {
    subnet_id = aws_subnet.public_subnet_a.id
    route_table_id = aws_route_table.route_public_a.id
}

## SUBNET PRIVATE A
resource "aws_route_table" "route_private_a" {
  vpc_id = aws_vpc.default.id
  tags= {
      Name = "Private Route A"
  }
  route {
      cidr_block = "0.0.0.0/0"
      nat_gateway_id = aws_nat_gateway.nat_gateway_a.id
  }
}

resource "aws_route_table_association" "route_subnet_private_a" {
    route_table_id = aws_route_table.route_private_a.id
    subnet_id = aws_subnet.private_subnet_a.id
}


########### SUBNET PUBLIC B ############
resource "aws_route_table" "route_public_b" {
  vpc_id = aws_vpc.default.id
  tags= {
      Name = "Public Route B"
  }
  route {
      cidr_block = "0.0.0.0/0"
      gateway_id = aws_internet_gateway.igw_terraform.id
  }
}

resource "aws_route_table_association" "route_subnet_public_b" {
    subnet_id = aws_subnet.public_subnet_b.id
    route_table_id = aws_route_table.route_public_b.id
}

## SUBNET PRIVATE B
resource "aws_route_table" "route_private_b" {
  vpc_id = aws_vpc.default.id
  tags= {
      Name = "Private Route B"
  }
  route {
      cidr_block = "0.0.0.0/0"
      nat_gateway_id  = aws_nat_gateway.nat_gateway_b.id
  }
}

resource "aws_route_table_association" "route_subnet_private_b" {
    route_table_id = aws_route_table.route_private_b.id
    subnet_id = aws_subnet.private_subnet_b.id
}

