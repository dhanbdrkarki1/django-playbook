# managing domain using ec2 ip

# get hosted zone details
data "aws_route53_zone" "hosted_zone" {
  name = var.domain_name
}

# simple routing policy
resource "aws_route53_record" "www_domain" {
  zone_id = data.aws_route53_zone.hosted_zone.zone_id
  name    = var.record_name
  type    = "A"
  ttl     = 300
  records = [var.ec2_public_ip]
}