# Overview

Basic example for the module.
Per default the module will be deployed in eu-west-1 (ireland).

## Deploy the infrastructure

```bash
# terraform init
# terraform plan -out container-system.plan -var deploy_profile=<your-profile>
# terraform apply container-system.plan

# on playground
terraform init
terraform plan -out container-system.plan -var deploy_profile=playground
terraform apply container-system.plan
```

Now you can either configure your shell using the bootstrap.sh script by calling:

```bash
source ./bootstrap.sh
```

Or you follow the preceding instructions.


## Setup helper scripts

```bash
script_dir=$(pwd)/../helper && export PATH=$PATH:$script_dir \
&& export AWS_PROFILE=playground
```

## Nomad

### Configure and check nomad

```bash
# Set the NOMAD_ADDR env variable
export NOMAD_ADDR=http://$(terraform output nomad_ui_alb_dns)
echo ${NOMAD_ADDR}
```

### Wait until the nomad nodes are available

```bash
# wait for servers and clients
wait_for_servers.sh  \
&& wait_for_clients.sh
```

### (Optional) Show some commands

```bash
nomad-examples-helper.sh
```

## Consul

### (Optional) Configure and check consul

```bash
# Set the CONSUL_HTTP_ADDR env variable
export CONSUL_HTTP_ADDR=http://$(terraform output consul_ui_alb_dns)
echo ${CONSUL_HTTP_ADDR}
```

### (Optional) Wait until the consul nodes are available

```bash
# wait for servers and clients
## TBD
```

### (Optional) Watch for services to be registered at consul

```bash
# watch ping-service
watch -x consul watch -service=ping-service -type=service

# watch fabio
watch -x consul watch -service=fabio -type=service
```

## Deploy sample services

```bash
job_dir=$(pwd)/../jobs

# 1. Deploy fabio
nomad run $job_dir/fabio.nomad

# 2. Deploy ping_service
nomad run $job_dir/ping_service.nomad
```

## Open UI's

```bash
xdg-open $(get_ui_albs.sh | awk '/consul/ {print $3}') && \
xdg-open $(get_ui_albs.sh | awk '/nomad/ {print $3}')  && \
xdg-open $(get_ui_albs.sh | awk '/fabio/ {print $3}')
```

## Test the service

```bash
# call the service over loadbalancer
ingress_alb_dns=$(terraform output ingress_alb_dns)
watch -x curl -s http://$ingress_alb_dns/ping
```

## Destroy the infrastructure

```bash
# terraform destroy -var deploy_profile=<your-profile>

# on playground
terraform destroy -var deploy_profile=playground
```

## (Optional) Enable SSH access to instances

Connect to the bastion using sshuttle

```bash
# call
sshuttle_login.sh
```

## Architecture

### Network Setup

![Nomad architecture root-example](https://raw.githubusercontent.com/niigataken/terraform-cos/master/_docs/architecture-root-example.png)

### Datacenter Configuration

* [ ] TODO: Describe the configuration of the different Nomad datacenters.
