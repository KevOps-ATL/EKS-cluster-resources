resource "aws_subnet" "pubsub1" {
  vpc_id            = var.vpc_id
  cidr_block        = "10.0.1.0/25"
  availability_zone = "us-east-1a"

  tags = {
    name = "pubsub1"
  }

}

resource "aws_subnet" "pubsub2" {
  vpc_id            = var.vpc_id
  cidr_block        = "10.0.1.0/25"
  availability_zone = "us-east-1b"

  tags = {
    name = "pubsub2"
  }

}
resource "aws_subnet" "pubsub3" {
  vpc_id            = var.vpc_id
  cidr_block        = "10.0.1.0/25"
  availability_zone = "us-east-1c"

  tags = {
    name = "pubsub3"
  }

}
resource "aws_subnet" "privsub1" {
  vpc_id            = var.vpc_id
  cidr_block        = "10.0.1.0/25"
  availability_zone = "us-east-1a"

  tags = {
    name = "privsub1"
  }

}
resource "aws_subnet" "privsub2" {
  vpc_id            = var.vpc_id
  cidr_block        = "10.0.1.0/25"
  availability_zone = "us-east-1b"

  tags = {
    name = "privsub2"
  }

}
resource "aws_subnet" "privsub3" {
  vpc_id            = var.vpc_id
  cidr_block        = "10.0.1.0/25"
  availability_zone = "us-east-1c"

  tags = {
    name = "privsub3"
  }

}

