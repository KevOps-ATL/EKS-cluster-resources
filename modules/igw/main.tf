resource "aws_internet_gateway" "default" {
  vpc_id = var.vpc_id

  tags = {
    name = "cloudComaVPC"
  }
}

#Public Route to IGW
resource "aws_route_table" "pub" {
  vpc_id = var.vpc_id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.default.id
  }
  tags = {
    name = "publicRT"
  }
}

# Private route to NAT GW
