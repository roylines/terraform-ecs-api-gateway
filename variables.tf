variable "vpc" {
  description = "the vpc name"
}

variable "vpc_id" {
  description = "the vpc id"
}

variable "public_zone_id" {
  description = "the hosted zone id for the domain to register with"
}

variable "public_domain" {
  description = "the domain name to register with, e.g. mydomain.com"
}

variable "public_subdomain" {
  description = "the subdomain to register with, e.g. www"
}

variable "vpc_id" {
  description = "the vpc id"
}

variable "subnets" {
  description = "the subnets"
}

variable "private_zone_id" {
  description = "the r53 private zone id"
}

variable "cluster_id" {
  description = "the cluster_id"
}

variable "name" {
  description = "the gateway name"
}

variable "image" {
  description = "the docker container image to use"
}

variable "port" {
  description = "the port"
}

variable "desired_count" {
  description = "the number of gateways to provision"
}
