resource "namecheap_domain_records" "synoro_domain" {
  for_each = toset(var.namecheap_domains)
  domain = each.key
  mode   = "OVERWRITE"
  nameservers = data.cloudflare_zone.synoro.name_servers
  depends_on = [
    data.cloudflare_zones.synoro
  ]
}
