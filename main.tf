terraform {
  backend "remote" {
    hostname     = "app.terraform.io"
    organization = "Synoro"

    workspaces {
      name = "dns"
    }
}
  required_providers {
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "~> 4.3.0"
    }
    namecheap = {
      source  = "namecheap/namecheap"
      version = ">= 2.0.0"
    }
  }
}

provider "cloudflare" {
  api_token = var.cf_api_token
}

provider "namecheap" {
  api_key   = var.nc_api_key
  user_name = var.nc_user_name
  api_user  = var.nc_api_user
}