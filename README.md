# AWS-Terraform-Ansible-Docker-Compose
This repository contains an example of spinning up a few AWS resources using [Terraform](https://www.terraform.io/ "Terraform") and uses [Ansible](https://www.ansible.com/ "Ansible") to install [Docker](https://www.docker.com/ "Docker") & [Docker Compose](https://docs.docker.com/compose/ "docker-compose") packages along with deployment of [sample](https://github.com/nirmalpathak/sample-flask-prometheus-app "sample") Python Flask web application.

### Workflow

- Terraform will create an EC2 instance and Security Group & will invoke the Ansible playbook.
- The Ansible playbook will install Docker & docker-compose along with some pre-requisite packages. The Ansible playbook will also deploy containers of sample Python Flask web application and HAProxy.
- The 'docker-compose.yaml' file contains the docker container orchestration code.

### Pre-requisite
- Packages required to run this code successfully.
	- Git
	- Ansbile > v2.8.4
	- Terraform

- AWS account with permission to create EC2 instance & Security Group along with AWS Access Keys (Access Key ID and Secret Access Key).

- Export your AWS keys as environment variables.
```
	$ export AWS_ACCESS_KEY_ID="ABCDEFGH"
	$ export AWS_SECRET_ACCESS_KEY="ajdhjshdu!jhajsd"
```
### Usage

- Clone this git repo and go to directory named `terraform`.
- Replace values of SSH key variables with your key name in file `varaibles.tf`.
```
variable "key_pair" {
  default = "your_key_name"
}

variable "ssh_key_private" {
  default = "path_to_your_key.pem"
}
```

- Run following Terraform commands for provisioning,

```
	  $ terraform init
	  $ terraform plan
	  $ terraform apply
```
### Verify

- If Terraform provisioning went well then you should be able to `curl` or use browser to hit the IP of newly created AWS EC2 instance.
- For Example,
```
$ curl 1.2.3.4
Hello World! Running on Host: dee06c8d0cce Version: v0.1

$ curl 1.2.3.4
Hello World! Running on Host: 3a7ac54acaaa Version: v0.2
```
