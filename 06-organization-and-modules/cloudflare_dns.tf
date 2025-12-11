# cloudflare dns config
data "cloudflare_zone" "primary" { 
  filter = {
    name = "ashen-dissanayake.fyi"
  }
}

resource "cloudflare_dns_record" "terrform_subdomain" {
  zone_id = data.cloudflare_zone.primary.id
  name    = "terraform"
  type    = "CNAME"
  content = aws_lb.load_balancer.dns_name
  ttl     = 1
  proxied = false
}
