variable "app_name" {
    type = string
    default = "leanflow"
}

variable "region" {
    type = string
    default = "us-west-2"
}

################# VPC #######################

variable "vpc_cidr" {
    type = string
    default = "10.0.0.0/16"
    description = "the vpc cdir range"
}

variable "vpc_name" {
    type = string
    default = "vpc_terraform"
}

################# SUBNET #######################


variable "public_subnet_a_cdir" {
    type = string
    default = "10.0.1.0/24"
}

variable "private_subnet_a_cdir" {
    type = string
    default = "10.0.2.0/24"
}

variable "public_subnet_b_cdir" {
    type = string
    default = "10.0.3.0/24"
}

variable "private_subnet_b_cdir" {
    type = string
    default = "10.0.4.0/24"
}


################# EC2 #######################

variable "instance_type"{
    type = string
    #default = "t3.micro"
    default = "t3.small"
}

################# aws launch template #######################

variable "launch_template_name" {
    type = string
    default = "template_terraform2"
}

################# ALB ##########################
variable "alb_name" {
    type = string
    default = "alb-terraform"    
}

variable "target_group_name" {
    type = string
    default = "tg-terraform"    
}


################# ECS ##########################
variable "cluster_name"{
    type = string
    default = "cluster_terraform"   
}

variable "ecs_service_name"{
    type = string
    default = "ecs_service_terraform"   
}
################# TASK DEFINITION ##########################


################# ECR ##########################
variable "ecr_image_uri" {
  description = "The URI of the image to run for the environment"
  #default = "275430173160.dkr.ecr.us-west-2.amazonaws.com/juego2:latest"
  default = "275430173160.dkr.ecr.us-west-2.amazonaws.com/nginx:latest"
}


################# SECRETS ###########################
variable "db_user_arn" {
  description = "The DB user arn, value is stored in AWS Secrets Manager"
  default = "arn:aws:secretsmanager:us-west-2:275430173160:secret:prod/juego2/db_user-2dAZSo"
}

variable "db_password_arn" {
  description = "The DB password arn, value is stored in AWS Secrets Manager"
  default =  "arn:aws:secretsmanager:us-west-2:275430173160:secret:prod/juego2/db_password-0HNZ2F"
}

variable "secret_key_base_arn" {
  description = "The Phoenix secret"
  default = "arn:aws:secretsmanager:us-west-2:275430173160:secret:secret_key_base-gr8IWf"
}