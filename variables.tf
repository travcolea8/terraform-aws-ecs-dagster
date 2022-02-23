variable "aws_availability_zone" {
  type        = string
  default     = ""
  description = "The availability zone of the resource."
}

variable "aws_region" {
  type        = string
  default     = "us-east-1"
  description = "The region of the aws account"
}

variable "certificate_arn" {
  type        = string
  default     = ""
  description = "The arn of the certificate that will be used."
}

variable "dagster_config_bucket" {
  type        = string
  description = "Dagster bucket containing the config files."
  default     = "dagster-bucket-travis"
}

variable "dagster-container-home" {
  type    = string
  default = "/opt"
}

variable "dagster_file" {
  type        = string
  default     = "dagster.yaml"
  description = "The config file needed to use database and daemon with dagit."
}

variable "dns_name" {
  type        = string
  default     = ""
  description = "The dns name that will be used to expose Dagster. It will be auto generated if not provided."
}

variable "ecs_cpu" {
  type        = number
  default     = 1024
  description = "The amount of cpu to give to the ECS instance."
}

variable "ecs_memory" {
  type        = number
  default     = 2048
  description = "The amount of ecs memory to give to the ECS instance."
}

variable "ip_allow_list" {
  type        = list(string)
  description = "A list of ip ranges that are allowed to access the airflow webserver, default: full access"
  default     = ["0.0.0.0/0"]
}

variable "log_retention" {
  type        = number
  default     = 7
  description = "The number of days that the logs shoud live."
}

variable "private_subnet" {
  type        = list(string)
  default     = []
  description = "The private subnets where the RDS and ECS reside."

  validation {
    condition     = length(var.private_subnet) >= 2 || length(var.private_subnet) == 0
    error_message = "The size of the list \"private_subnet_ids\" must be at least 2 or empty."
  }
}

variable "public_subnet" {
  type        = list(string)
  default     = ["subnet-0416be1694a124308", "subnet-02db4397d3d901a9b"]
  description = "The public subnet where the load balancer should reside. Moreover, the ecs and rds will use these if no private subnets are defined. At least two should be provided."

  validation {
    condition     = length(var.public_subnet) >= 2
    error_message = "There should be at least 2 public subnet id."
  }
}

variable "route53_zone_name" {
  type        = string
  default     = ""
  description = "The name of the route53 zone that will be used for the certificate validation."
}

variable "rds_deletion_protection" {
  type        = bool
  default     = false
  description = ""
}

variable "rds_instance_class" {
  type        = string
  default     = "db.t2.micro"
  description = "The type of instance class for the RDS."
}

variable "rds_password" {
  type        = string
  default     = "password"
  description = "The password to access the RDS instance."
  sensitive   = true
}

variable "rds_username" {
  type        = string
  default     = "dagster_rds"
  description = "The username to access the RDS instance."
}

variable "resource_prefix" {
  type        = string
  default     = "ps"
  description = "The prefix of the resource to be created"
}

variable "resource_suffix" {
  type        = string
  default     = "sp"
  description = "The suffix of the resource to be created"
}

variable "rds_skip_final_snapshot" {
  type        = bool
  default     = true
  description = "Whether or not to skip the final snapshot before deleting (mainly for tests)"
}

variable "tags" {
  type        = map(string)
  default     = { Name = "Terraform-aws-dagster" }
  description = "Tags to add to the created resources."
}

variable "use_https" {
  type        = bool
  description = "Expose traffic using HTTPS or not"
  default     = false
}

variable "vpc" {
  type        = string
  default     = "vpc-0cc006e54812ccf99"
  description = "The id of the virtual private cloud."
}

variable "workspace_file" {
  type        = string
  default     = "workspace.yaml"
  description = "The config file needed to run dagit."
}
