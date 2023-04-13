# Synoro Cloudflare dns settings

This repository manages the Synoro domain settings using terraform cloud.

Run:
```bash
terraform plan
git commit
git push
```

You need a `.auto.tfvars` file structured like this:
```terraform
cf_api_token = "key"
nc_user_name = "username"
nc_api_user = "user"
nc_api_key = "key"
```

## Namecheap ip whitelisting (IPs don't match)

Since Namecheap requires the whitelisting of IPs, this is how you get the latest Terraform Cloud IPs:
```bash
curl --silent --request GET "https://app.terraform.io/api/meta/ip-ranges" | jq ".vcs"
```

TODO: For some reason I am getting different IPs than the ones shown there, need to investigate (running the plan locally for now)