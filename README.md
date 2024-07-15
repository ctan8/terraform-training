# terraform-introduction
Terraform and Terragrunt introduction

## 1. Create Compute Engine

1. In your Cloud Shell editor, create a folder called compute-engine

2. Then, create the `main.tf`, <code>variables.tf</code>, <code>outputs.tf</code> and <code>providers.tf</code> in that folder
3. Populate those .tf files with the correct Terraform configuration. For compute engine, the Terraform registry doc is https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_instance
4. Go to your cloud shell and cd to the compute-engine folder
Then do <code>terraform init</code>, then <code>terraform plan</code> (you can see that the there’s the terraform state file in your directory), then <code>terraform apply</code>.
5. Once you are done, check the compute engine is created. Then after that destroy your resources with <code>terraform destroy</code>

## 2. Use locals variables

1. Create a `locals.tf` to input name

    ```
    locals {
    name = "calvyn-terraform"
    }
    ```
2. Update the name arguments in your main.tf resource block, e.g.

    ```
    resource "google_compute_network" "vpc_network" {
    name                    = "${local.name}"-vpc
    auto_create_subnetworks = false
    }

3. Use the local.name on all the other resource block - subnet, google compute instances. 

4. Commented out the variables of vpc_name, subnet_name and instance_name from the variables.tf

## 3. Use Data Sources for VPC and Subnet for your compute engine

1. Create VPC and Subnet using `gcloud` commands

    1a. VPC - `gcloud compute networks create calvyn-vpc --subnet-mode=auto`
    1b. Subnet - `gcloud compute networks subnets create calvyn-subnet --network=calvyn-vpc --region=europe-west2 --ranges=10.0.0.0/24`

2. Create a `data.tf` file
    ```
    data "google_compute_network" "my-network" {
    name = "calvyn-vpc"
    }

    data "google_compute_subnetwork" "my-subnetwork" {
    name   = "calvyn-subnet"
    region = "europe-west2"
    }

3. In the `main.tf` file, commented out

    ```
    # Create VPC
    # resource "google_compute_network" "vpc_network" {
    #   name                    = var.vpc_name
    #   auto_create_subnetworks = false
    # }

    # # Create subnet compute engine
    # resource "google_compute_subnetwork" "subnetwork" {
    #   name          = var.subnet_name
    #   ip_cidr_range = var.subnet_ip
    #   region        = var.region
    #   network       = google_compute_network.vpc_network.name
    # }

4. And the network interface code will need to change

    ```
    network_interface {
    network    = data.google_compute_network.my-network.name
    subnetwork = data.google_compute_subnetwork.my-subnetwork.name
    }

## 4. Use .tfvars for input variables

1. Create a `terraform.tfvars` file and insert all the variables 

    ```
    project_id = "dna-tfm-trn-2475"
    region = "europe-west2"
    zone = "europe-west2-a"
    machine_type = "e2-small"

2. Remove all the default values from `variables.tf`

## 5. Use meta arguments

1. Input the count argument for the `google_compute_instances` resource block in the `main.tf`

    ```
    resource "google_compute_instance" "default" {
    count        = 3
    name         = var.instance_name
    machine_type = var.machine_type
    zone         = var.zone

    boot_disk {
        initialize_params {
        image = "debian-cloud/debian-12"
        }
    }

    network_interface {
        network    = google_compute_network.vpc_network.name
        subnetwork = google_compute_subnetwork.subnetwork.name
        }
    }

2. Update the instances outputs in the `outputs.tf` to reflect the number of instances

    ```
    output "instance_name" {
    value = google_compute_instance.default[0].name
    }

    output "instance_zone" {
    value = google_compute_instance.default[0].zone
    }