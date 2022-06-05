variable "ami" {
  description = "The AMI to use for the instance. Debian Buster"
  type        = string
  default     = "ami-053a82fad3faa66b7"
}

variable "instance_type" {
  description = "ec2 instance type"
  type        = string
  default     = "t2.micro"
}

variable "db_user" {
  description = "The username for the database"
  type        = string
  default     = "db_user"
}

variable "db_password" {
  description = "The password for the database"
  type        = string
  default     = "db_password"
  sensitive   = true
}
