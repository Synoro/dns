resource "cloudflare_page_rule" "wwwredirects" {
  for_each = {
    for zone in data.cloudflare_zones.synoro.zones :
    zone.id => zone
    if zone.id != data.cloudflare_zones.synoroch.zones[0].id
  }

  zone_id  = each.value.id
  target   = "www.${each.value.name}/"
  priority = 1

  actions {
    forwarding_url {
      url         = "https://synoro.ch"
      status_code = "301"
    }
  }
}

resource "cloudflare_page_rule" "redirects" {
  for_each = {
    for zone in data.cloudflare_zones.synoro.zones :
    zone.id => zone
    if zone.id != data.cloudflare_zones.synoroch.zones[0].id
  }

  zone_id  = each.value.id
  target   = "${each.value.name}/"
  priority = 1

  actions {
    forwarding_url {
      url         = "https://synoro.ch"
      status_code = "301"
    }
  }
}