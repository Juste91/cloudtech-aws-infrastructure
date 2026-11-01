resource "aws_security_group" "ec2_ssm_sg" {
  name_prefix = "cloudtech-ec2-ssm-"
  description = "CloudTech EC2 SSM security group"
  vpc_id      = aws_vpc.cloudtech_vpc.id

  tags = {
    Name    = "CloudTech-EC2-SSM-SG"
    Project = "CloudTech-Portfolio"
  }
}

resource "aws_vpc_security_group_egress_rule" "https" {
  security_group_id = aws_security_group.ec2_ssm_sg.id
  description       = "Allow outbound HTTPS for SSM"
  ip_protocol       = "tcp"
  from_port         = 443
  to_port           = 443
  cidr_ipv4         = "0.0.0.0/0"
}

resource "aws_iam_role" "ec2_ssm_role" {
  name = "CloudTech-Terraform-EC2-SSM-Role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Effect = "Allow"
      Principal = {
        Service = "ec2.amazonaws.com"
      }
      Action = "sts:AssumeRole"
    }]
  })

  tags = {
    Project = "CloudTech-Portfolio"
  }
}

resource "aws_iam_role_policy_attachment" "ssm_policy" {
  role       = aws_iam_role.ec2_ssm_role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"
}

resource "aws_iam_instance_profile" "ec2_profile" {
  name = "CloudTech-Terraform-EC2-Profile"
  role = aws_iam_role.ec2_ssm_role.name
}
