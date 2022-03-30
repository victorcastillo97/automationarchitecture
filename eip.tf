resource "aws_eip" "eip_nat_a" {
    vpc = true
}
resource "aws_eip" "eip_nat_b" {
    vpc = true
}