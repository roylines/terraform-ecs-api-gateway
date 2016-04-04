module "microservice" {
  source = "github.com/roylines/terraform-ecs-microservice"
  
  vpc_id = "${var.vpc_id}"
  vpc = "${var.vpc}"
  subnets = "${var.subnets}"
  cluster_id = "${var.cluster_id}"
  private_zone_id = "${var.private_zone_id}"

  name = "${var.name}"
  image = "${var.image}"
  port = "${var.port}"
  desired_count = "${var.desired_count}"
  internal = false
}

resource "aws_route53_record" "api_gateway_www" {
  zone_id = "${var.public_zone_id}"
  name = "${var.public_subdomain}.${var.public_domain}"
  type = "A"

  alias {
    name = "${module.microservice.elb_dns_name}"
    zone_id = "${module.microservice.elb_zone_id}"
    evaluate_target_health = false
  }
}
