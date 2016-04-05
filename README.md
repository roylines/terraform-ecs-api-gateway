# terraform-ecs-microservice
Latest release: *v1.0.0*

A terraform module for creating an api gateway within an ECS cluster.
It will create all the necessary tasks, and will create an ELB in front of each service. 
Additionally a record will be added to the public domain allowing external routing.
There are several [variables](https://github.com/roylines/terraform-ecs-api-gateway/blob/master/variables.tf) that can be set to configure, for example, the port and desired count of services.

This module is normally used in conjunction with (https://github.com/roylines/terraform-ecs)[https://github.com/roylines/terraform-ecs] 

# Usage 
Instructions for using terraform modules can be found within the [Terraform documentation](https://www.terraform.io/docs/modules/usage.html)
It is strongly recommended that when using this module, you use versioned links to the repository.

The following minimal terraform template example will create the cluster, and api gateway using the supplied ssh public key.

```
variable "vpc" {
  description = "the name to use for the vpc"
}

variable "ssh_public_key" {
  description = "the public key to allow ssh access to the clustered instances"
}

variable "public_zone_id" {
  description = "the hosted zone id for the domain"
}

variable "public_domain" {
  description = "the name for the domain"
}

module "ecs" {
  vpc = "${var.vpc}"
  source = "git::https://github.com/roylines/terraform-ecs?ref=v2.0.0" 
  ssh_public_key = "${var.ssh_public_key}"
}

module "api-gateway" {
  source = "git::https://github.com/roylines/terraform-ecs-api-gateway?ref=v1.0.0" 
  // don't change these
  vpc_id = "${module.ecs.vpc_id}"
  vpc = "${var.vpc}"
  subnets = "${module.ecs.subnets}"
  cluster_id = "${module.ecs.cluster_id}"
  private_zone_id = "${module.ecs.private_zone_id}"
  public_zone_id = "${var.public_zone_id}"
  public_domain = "${var.public_domain}"
  
  // you can change these
  public_subdomain = "www"
  name = "api-gateway"
  image = "roylines/nginx"
  port = 8000
  desired_count = 2
}

```

A more complex example can be found at [https://github.com/roylines/terraform-ecs-example](https://github.com/roylines/terraform-ecs-example) 
