variable "region" {}
variable "vpc_cidr" {}
variable "availability_zones" {}
variable "private_network_cidr" {}

variable "component" {}
variable "deployment_identifier" {}

variable "private_zone_id" {}

variable "cluster_name" {}
variable "cluster_instance_ssh_public_key_path" {}
variable "cluster_instance_type" {}
variable "cluster_instance_root_block_device_size" {}
variable "cluster_instance_docker_block_device_size" {}

variable "cluster_minimum_size" {}
variable "cluster_maximum_size" {}
variable "cluster_desired_capacity" {}

variable "infrastructure_events_bucket" {}
