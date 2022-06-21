# Metadata  Variables

variable "region" {
  type        = string
  default     = "us-east-1"
  description = "Region in which resources are going to be created"

}

variable "prefix" {
  type        = string
  default     = "phoenix"
  description = "This is the prefix for all the resoures in this module"

}

variable "env" {
  type        = string
  default     = "Test"
  description = "Environment to which the resource belong to"

}

variable "project" {
  type        = string
  default     = "Phoenix-I"
  description = "Name of the project for which resources are created"

}


# VPC Variables 

variable "vpcCidr" {
  type        = string
  default     = "10.100.0.0/18"
  description = "CIDR Range for the VPC"

}


variable "sourceip" {
  description = "IP address of the source "
  type        = string

}

# Subnet variables

variable "privateSubnetCidr" {
  type          = string
  default       = "10.100.12.0/24"
  description = "CIDR for the private subnet"

}


variable "pubSubnetCidr" {
  type          = list(string)
  default       = ["10.100.1.0/24","10.100.2.0/24", "10.100.3.0/24", "10.100.4.0/24", "10.100.5.0/24", "10.100.6.0/24", "10.100.7.0/24"]
  description = "CIDR for the Public subnet"

}

variable "webSubnetCidr" {
  type          = string
  default       = "10.100.10.0/24"
  description = "CIDR for the Web ssubnet"

}


# ec2 variables

variable "web_nodes" {
  type = number
  description = "number of desired web instances"
}

variable "publicKeyPath" {
  type        = string
  default     = "/opt/mylab/keys/myops.pub"
  description = "Location of your public key"

}


variable "webInstanceSize" {
  type        = string
  default     = "t2.micro"
  description = "Size of the web instance"

}