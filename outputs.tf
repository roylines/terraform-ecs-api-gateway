output "elb_dns_name" {
  value = "${module.microservice.elb_dns_name}"
}

output "elb_zone_id" {
  value = "${module.microservice.elb_zone_id}"
}
