data "cloudflare_zones" "synoro" {
  filter {
    name        = "synoro"
    lookup_type = "contains"
    status      = "active"
  }
}

data "cloudflare_zone" "synoro" {
  name = data.cloudflare_zones.synoro.zones[0].name
}

# output "name" {
#   value = data.cloudflare_zones.synoro.zones
# }


resource "cloudflare_record" "www" {
  for_each = {
    for zone in data.cloudflare_zones.synoro.zones :
    zone.id => zone
    if zone.id != data.cloudflare_zones.synoroch.zones[0].id
  }

  zone_id = each.value.id
  name    = "www"
  value   = "synoro.netlify.app"
  type    = "CNAME"
  proxied = true
}

resource "cloudflare_record" "root" {
  for_each = {
    for zone in data.cloudflare_zones.synoro.zones :
    zone.id => zone
    if zone.id != data.cloudflare_zones.synoroch.zones[0].id
  }
  zone_id = each.value.id
  name    = "@"
  value   = "synoro.netlify.app"
  type    = "CNAME"
  proxied = true
}


resource "cloudflare_record" "rootch" {
  zone_id = data.cloudflare_zones.synoroch.zones[0].id
  name    = "@"
  value   = "synoro.netlify.app"
  type    = "CNAME"
  proxied = false
}

resource "cloudflare_record" "wwwrootch" {
  zone_id = data.cloudflare_zones.synoroch.zones[0].id
  name    = "www"
  value   = "synoro.netlify.app"
  type    = "CNAME"
  proxied = false
}