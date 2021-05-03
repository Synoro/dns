resource "cloudflare_record" "medium1" {
  zone_id = data.cloudflare_zones.synoroch.zones[0].id
  name    = "blog"
  value   = "162.159.153.4"
  type    = "A"
  proxied = false
}

resource "cloudflare_record" "medium2" {
  zone_id = data.cloudflare_zones.synoroch.zones[0].id
  name    = "blog"
  value   = "162.159.152.4"
  type    = "A"
  proxied = false
}