# CloudTech AWS Infrastructure & Automation

## Overview

A hands-on cloud engineering portfolio project demonstrating
secure AWS infrastructure deployment and management using
Terraform Infrastructure as Code (IaC).

## Technologies

- AWS VPC, Subnets, Internet Gateway and Route Tables
- Amazon EC2 (Amazon Linux 2023)
- AWS IAM and Systems Manager Session Manager
- Amazon S3
- Terraform
- AWS CLI and AWS CloudShell
- Git and GitHub

## Architecture

Region: us-east-1

- VPC: 10.20.0.0/16
- Public Subnet: 10.20.1.0/24
- Internet Gateway and public route table
- EC2 security group with no inbound rules
- IAM role for AWS Systems Manager
- Temporary Amazon Linux 2023 EC2 instance
- Private, encrypted, versioned S3 bucket

## Security Controls

- No inbound SSH access
- IAM role-based EC2 permissions
- Session Manager for remote administration
- IMDSv2 required on EC2
- Encrypted EC2 root volume
- S3 Block Public Access enabled
- S3 SSE-S3 encryption enabled
- S3 versioning enabled
- S3 bucket policy denying insecure HTTP transport

## Implementation

1. Installed and configured Terraform in AWS CloudShell.
2. Provisioned VPC, subnet, Internet Gateway and routing.
3. Created an EC2 security group and IAM instance profile.
4. Deployed Amazon Linux 2023 EC2 with Terraform.
5. Connected through AWS Systems Manager without SSH.
6. Verified EC2 security and terminated the test instance.
7. Created and verified secure Amazon S3 storage.
8. Removed temporary S3 test object versions.

## Verification

- terraform fmt
- terraform validate
- terraform plan
- terraform apply
- terraform state list
- AWS Console security checks
- Systems Manager connection testing
- S3 upload and version cleanup

## Cost Management

Temporary EC2 resources were removed after testing.
The reusable networking, IAM and S3 infrastructure
was retained for future labs.

AWS charges may apply when deploying this project.

## Skills Demonstrated

- Infrastructure as Code
- Cloud networking
- IAM and access management
- Secure cloud administration
- Infrastructure troubleshooting
- Cloud security fundamentals
- Resource lifecycle and cost management

## Next Projects

- AWS Monitoring and Alerting
- GitHub Actions CI/CD for Terraform

## Author

CloudTech AWS Portfolio
