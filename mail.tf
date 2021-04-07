
data "cloudflare_zones" "synoroch" {
  filter {
    name = "synoro.ch"
  }
}

resource "cloudflare_record" "aspmx" {
  zone_id  = data.cloudflare_zones.synoroch.zones[0].id
  name     = "@"
  value    = "ASPMX.L.GOOGLE.COM"
  type     = "MX"
  priority = "1"
}
resource "cloudflare_record" "alt1" {
  zone_id  = data.cloudflare_zones.synoroch.zones[0].id
  name     = "@"
  value    = "ALT1.ASPMX.L.GOOGLE.COM"
  type     = "MX"
  priority = "5"
}
resource "cloudflare_record" "alt2" {
  zone_id  = data.cloudflare_zones.synoroch.zones[0].id
  name     = "@"
  value    = "ALT2.ASPMX.L.GOOGLE.COM"
  type     = "MX"
  priority = "5"
}
resource "cloudflare_record" "alt3" {
  zone_id  = data.cloudflare_zones.synoroch.zones[0].id
  name     = "@"
  value    = "ALT3.ASPMX.L.GOOGLE.COM"
  type     = "MX"
  priority = "10"
}
resource "cloudflare_record" "alt4" {
  zone_id  = data.cloudflare_zones.synoroch.zones[0].id
  name     = "@"
  value    = "ALT4.ASPMX.L.GOOGLE.COM"
  type     = "MX"
  priority = "10"
}