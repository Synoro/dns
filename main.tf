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
      version = "~> 2.19.2"
    }
  }
}


terraform {

}

provider "cloudflare" {
  email   = var.email
  api_key = var.api_key
}