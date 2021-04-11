
data "cloudflare_zones" "synoroch" {
  filter {
    name = "synoro.ch"
  }
}

resource "cloudflare_record" "aspmx" {
  zone_id  = data.cloudflare_zones.synoroch.zones[0].id
  name     = "@"
  value    = "aspmx.l.google.com"
  type     = "MX"
  priority = "1"
}
resource "cloudflare_record" "alt1" {
  zone_id  = data.cloudflare_zones.synoroch.zones[0].id
  name     = "@"
  value    = "alt1.aspmx.l.google.com"
  type     = "MX"
  priority = "5"
}
resource "cloudflare_record" "alt2" {
  zone_id  = data.cloudflare_zones.synoroch.zones[0].id
  name     = "@"
  value    = "alt2.aspmx.l.google.com"
  type     = "MX"
  priority = "5"
}
resource "cloudflare_record" "alt3" {
  zone_id  = data.cloudflare_zones.synoroch.zones[0].id
  name     = "@"
  value    = "alt3.aspmx.l.google.com"
  type     = "MX"
  priority = "10"
}
resource "cloudflare_record" "alt4" {
  zone_id  = data.cloudflare_zones.synoroch.zones[0].id
  name     = "@"
  value    = "alt4.aspmx.l.google.com"
  type     = "MX"
  priority = "10"
}