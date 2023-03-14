# Cat API Infrastructure

This repo is home to any and all code related to cat api infrastructure. It contains all the terraform code needed for deploying the
Infrastructure.

# Architecture
![Alt text](./docs/eks_infra.png?raw=true "Architecture")

# Prerequisites:
1. Terraform  ---> https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli
2. AWS CLI ---> https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html
3. helm ---> https://helm.sh/docs/intro/install/
4. kubectl ---> https://kubernetes.io/docs/tasks/tools/

# Exploring the Repo

This repo cantains all the code to create the EKS infra, as well as its addons like nginx ingress for example, let's explore it:
1. addons  --->  this folder contains the addons to be installed after the EKS cluster is created
- alb_ingress: addon module to install alb ingress
- argocd: addon module to install argocd
- hpa: addon module to install horizontal pod auto scaler
- nginx_ingress: addon module to install nginx ingress
- node_autoscaler: addon module to install the node auto scaler 
2. ecr  ---> module to create ecr (Elastic container registery)
3. eks ---> module to create the EKS cluster itself (not the nodes)
4. elasticache ---> module to create the elastic search (redis) cluster
5. elasticache_subnet_group ---> module to create the subnet group for elasticache
6. sg ---> module to create security groups
7. vpc ---> module the create the vpc, it creates a public and private subent in each az in the region

# Resources created
1. VPC with public and private subent in each az in the region, it also deploys a nat gateway to be used by the private subnets.
2. EKS cluster in all the available subnets public and private, not that the node groups are deployed in only the private subents
3. One node group in private subents
4. Elastic cahe Redis cluster in private subents
5. ECR for the backend app
6. Multiple security groups

# Example of deploying the infra

```bash
terraform init
```

```bash
terraform apply --var-file dev.tfvars
```

### If you want to destroy to infra

```bash
terraform destroy --var-file dev.tfvars
```