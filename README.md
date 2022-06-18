# Terraform Configuration for VPC deployment.

## Purpose 

Create the following resources

- VPC
- 3 subnets
- IGW
- S3 

## Prerequisites

- aws cli
- terraform
- Programmatic access with VPC Create and S3 bucket create permissions

## Usage

- git clone this repository.

- `cd` into the folder.

- Rename the `terraformtfvars.dummy` to `terraform.tfvars` 

- Update the variable values 

- Run `terraform plan` to see the resources that get created.

- Run `terraform apply` to create the resources

