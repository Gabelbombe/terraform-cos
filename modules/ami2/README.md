# Overview

- [ ] TODO: Explaining the available AMIs.

## Amazon Linux 2

https://aws.amazon.com/de/amazon-linux-2/release-notes/

### AMI without ECR support

The packer definition `nomad-consul-docker.json` creates an ami that can load docker images from public repositories such as docker hub.

- Nomad
- Consul
- Docker
- privileged mode activated

### AMI with ECR support

The packer definition `nomad-consul-docker-ecr.json` creates an ami with ECR support. That means you can load docker images hosted at a AWS ECR of your account.

- Nomad
- Consul
- Docker
- privileged mode activated
- AWS ECR plugin

## Create the Machine Image

### Prepare AWS Credentials

As described at [Authentication Packer](https://www.packer.io/docs/builders/amazon.html#authentication) you can use static, environment variables or shared credentials.

```bash
# environment variables
export AWS_ACCESS_KEY_ID=<your access key id>
export AWS_SECRET_ACCESS_KEY=<your secret key>
export AWS_DEFAULT_REGION=eu-west-1
```

### Build the AMI using Packer

The following can be applied for `nomad-consul-docker-ecr.json` and `nomad-consul-docker.json`

```bash
# Build it using the default variables specified in the packer file.
# Important variables are:
# aws_region - The region where the ami is build in. The exported account settings have to match to this region.
# ami_regions - A list (comma separated) of regions this ami should be available in as well (will be copied over).
# aws_account_ids - A list of AWS account Id's (comma separated list) this ami should be allowed to used from.
packer build nomad-consul-docker-ecr.json

# Build the AMI in eu-west-1 and make it available in eu-west-2 as well.
packer build -var 'aws_region=eu-west-1' -var 'ami_regions=eu-west-1,eu-west-2' nomad-consul-docker-ecr.json

# Build the AMI in eu-west-1, make it available in eu-west-2 as well and grant access from account 123456789 and 987654321.
packer build -var 'aws_region=eu-west-1' -var 'ami_regions=eu-west-1,eu-west-2' -var aws_account_ids='123456789,987654321' nomad-consul-docker-ecr.json
```
