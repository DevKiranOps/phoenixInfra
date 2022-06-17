# Metadata  Variables

variable "prefix" {
    type = string 
    default = "phoenix"
    description = "This is the prefix for all the resoures in this module"
  
}

variable "env" {
    type =  string
    default = "Test"
    description = "Environment to which the resource belong to"
  
}
variable "project" {
    type = string 
    default = "Phoenix-I"
    description = "Name of the project for which resources are created"
  
}


# VPC Variables 

variable "vpcCidr" {
    type = string
    default = "10.100.0.0/20"
    description = "CIDR Range for the VPC"
  
}
