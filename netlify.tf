terraform {
  required_providers {
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "~> 2.19.2"
    }
  }
}

provider "cloudflare" {
  email     = var.email
  api_key = var.api_key
}

data "cloudflare_zones" "synoro" {
  filter {
    name        = "synoro"
    lookup_type = "contains"
    status      = "active"
  }
}

output "name" {
  value = data.cloudflare_zones.synoro.zones
}


resource "cloudflare_record" "www" {
  for_each = { for zone in data.cloudflare_zones.synoro.zones : zone.id => zone }

  zone_id = each.value.id
  name    = "www"
  value   = "synoro.netlify.app"
  type    = "CNAME"
  proxied = false
}

resource "cloudflare_record" "root" {
  for_each = { for zone in data.cloudflare_zones.synoro.zones : zone.id => zone }

  zone_id = each.value.id
  name    = "@"
  value   = "synoro.netlify.app"
  type    = "CNAME"
  proxied = false
}