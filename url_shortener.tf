resource "cloudflare_record" "shortio" {
  zone_id = data.cloudflare_zones.synoroch.zones[0].id
  name    = "go"
  value   = "cname.short.io"
  type    = "CNAME"
  proxied = false
}