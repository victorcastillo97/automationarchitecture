resource "aws_subnet" "public_subnet_a" {
    vpc_id = aws_vpc.default.id
    availability_zone = "${var.region}a"
    cidr_block = var.public_subnet_a_cdir
    
    tags = {
      "Name" = "public_subnet_a"
    }
}

resource "aws_subnet" "private_subnet_a" {
    vpc_id = aws_vpc.default.id
    availability_zone = "${var.region}a"
    cidr_block = var.private_subnet_a_cdir
    
    tags = {
      "Name" = "private_subnet_a"
    }
}


resource "aws_subnet" "public_subnet_b" {
    vpc_id = aws_vpc.default.id
    availability_zone = "${var.region}b"
    cidr_block = var.public_subnet_b_cdir
    
    tags = {
      "Name" = "public_subnet_b"
    }
}


resource "aws_subnet" "private_subnet_b" {
    vpc_id = aws_vpc.default.id
    availability_zone = "${var.region}b"
    cidr_block = var.private_subnet_b_cdir
    
    tags = {
      "Name" = "private_subnet_b"
    }
}