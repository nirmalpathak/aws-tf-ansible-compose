resource "aws_instance" "my-web-instance" {
  ami             = "${data.aws_ami.ubuntu1804.id}"
  instance_type   = "t2.micro"
  key_name = "${var.key_pair}"
  vpc_security_group_ids = ["${aws_security_group.web.id}"]

#  user_data = << EOF
#	#! /bin/bash
#        sudo apt update
#	sudo apt install apt-transport-https ca-certificates curl gnupg-agent software-properties-common
#	curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
#	sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
#	sudo apt update
#	sudo apt install docker-ce
#	sudo usermod -aG docker $USER
#	sudo systemctl enable docker
#	sudo systemctl start docker
#  EOF
  tags =  {
    Name = "web-instance"
  }

  connection {
    private_key = "${file(var.ssh_key_private)}"
    host	= "${self.public_ip}"
    user        = "ubuntu"
  }

  provisioner "remote-exec" {
    inline = ["sudo apt install -y python"]
  }

  provisioner "local-exec" {
    command = <<EOT
      >hosts.ini; echo "[hosts]" | tee -a hosts.ini; echo "${aws_instance.my-web-instance.public_ip} ansible_user=ubuntu ansible_ssh_private_key_file=${var.ssh_key_private}" | tee -a hosts.ini;
      export ANSIBLE_HOST_KEY_CHECKING=False;
      ansible-playbook -u ubuntu --private-key ${var.ssh_key_private} -i hosts.ini provision.yml
    EOT
  }

}

resource "aws_security_group" "web" {
  name        = "sonicjob-web-example"
  description = "Security group to allow traffic from internet."
  #vpc_id      = "${aws_vpc.my-vpc.id}"

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 6060
    to_port     = 6060
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 9191
    to_port     = 9191
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 9292
    to_port     = 9292
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "sonicjob-web-example"
  }
}
