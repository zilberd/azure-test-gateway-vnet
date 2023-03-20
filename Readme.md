# DR network creation

This code will create the hub vnet, the gateway, the local gateway and the connection to the onprem vpn

# Usage

Populate the variables.auto.tfvars with the values.

## Secret values

The repos will ignore any variables file with the name *.local.auto.tfvars.

You can use this to create a file containing the IP and the preshared key. They won't be commited to the repo.

# To-DO

run TF docs, integrate the git-hook (fmt, validate,...) maybe some testing