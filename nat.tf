resource "aws_nat_gateway" "nat_gateway_a" {
    allocation_id = aws_eip.eip_nat_a.id
    subnet_id = aws_subnet.public_subnet_a.id
}

resource "aws_nat_gateway" "nat_gateway_b" {
    allocation_id = aws_eip.eip_nat_b.id
    subnet_id = aws_subnet.public_subnet_b.id
}