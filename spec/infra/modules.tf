module "base_network" {
  source = "git@github.com:infrablocks/terraform-aws-base-networking.git?ref=0.1.14//src"

  vpc_cidr = "${var.vpc_cidr}"
  region = "${var.region}"
  availability_zones = "${var.availability_zones}"

  component = "${var.component}"
  deployment_identifier = "${var.deployment_identifier}"

  private_zone_id = "${var.private_zone_id}"

  infrastructure_events_bucket = "${var.infrastructure_events_bucket}"
}

module "ecs_cluster" {
  source = "../../../src"

  region = "${var.region}"
  vpc_id = "${module.base_network.vpc_id}"
  private_subnet_ids = "${module.base_network.private_subnet_ids}"
  private_network_cidr = "${var.private_network_cidr}"

  component = "${var.component}"
  deployment_identifier = "${var.deployment_identifier}"

  cluster_name = "${var.cluster_name}"
  cluster_instance_ssh_public_key_path = "${var.cluster_instance_ssh_public_key_path}"
  cluster_instance_type = "${var.cluster_instance_type}"
  cluster_instance_root_block_device_size = "${var.cluster_instance_root_block_device_size}"
  cluster_instance_docker_block_device_size = "${var.cluster_instance_docker_block_device_size}"

  cluster_minimum_size = "${var.cluster_minimum_size}"
  cluster_maximum_size = "${var.cluster_maximum_size}"
  cluster_desired_capacity = "${var.cluster_desired_capacity}"
}
