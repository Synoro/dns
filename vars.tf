variable "cf_api_token" {
  type      = string
  sensitive = true
}

variable "nc_user_name" {
  type      = string
  sensitive = true
}

variable "nc_api_user" {
  type      = string
  sensitive = true
}

variable "nc_api_key" {
  type      = string
  sensitive = true
}

variable "namecheap_domains" {
  type = list(any)
  default = [
    "synoro.io",
    "synoro.net",
    "synoro.dev",
    "synoro.tech"
  ]
}
