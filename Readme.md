# DR network creation

Deploys a Azure Network Gateway in the DR region.

# Usage

Populate the variables.auto.tfvars with the values and complete

## Secret values

The repos will ignore any variables file with the name *.local.auto.tfvars.
You can use this to create a file containing the IP and the preshared key. They won't be commited to the repo.
```hcl
onpremises_gw_address = "XXX.XXX.XXX.XXX"
onpremises_shared_key = "thisIsSuperSecurePSK23!"
```

# To-DO

run TF docs, integrate the git-hook (fmt, validate,...) maybe some testing

# Deployed resources

## VNET
- resource_group_name   = `DR-RG-Manual`
- location              = `switzerlandnorth`
- virtual_network_name  = `helbnetzvnethubprod22`
- address_space         = `10.40.128.0/19`
- gateway_subnet        = `10.40.128.0/27`
- vnet_dns_servers      = `192.168.123.110, 192.168.123.111`

## Network Gateway
- gateway_name             = `helbnetzvnetgwprod22`
- gateway_public_ip        = `20.250.36.118`
- onpremises_address_space = `10.0.0.0/16, 172.16.0.0/12, 192.168.96.0/20, 192.168.123.0/24`

# Documentation


