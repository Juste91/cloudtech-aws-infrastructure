resource "aws_subnet" "public_subnet" {
  vpc_id                  = aws_vpc.cloudtech_vpc.id
  cidr_block              = "10.20.1.0/24"
  availability_zone       = "us-east-1a"
  map_public_ip_on_launch = false

  tags = {
    Name    = "CloudTech-Public-Subnet"
    Project = "CloudTech-Portfolio"
  }
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.cloudtech_vpc.id

  tags = {
    Name    = "CloudTech-Internet-Gateway"
    Project = "CloudTech-Portfolio"
  }
}

resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.cloudtech_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name    = "CloudTech-Public-RouteTable"
    Project = "CloudTech-Portfolio"
  }
}

resource "aws_route_table_association" "public_assoc" {
  subnet_id      = aws_subnet.public_subnet.id
  route_table_id = aws_route_table.public_rt.id
}
