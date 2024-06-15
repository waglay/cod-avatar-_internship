# cod-avatar-_internship

## Installation and Configuration of GitLab
- **Firstly a ec2 instance is hosted with any OS but in my case I have used Amazon Linux 2
- **After the instance is up and running ssh to the instance
- **There execute the following commands for installation of GitLab:** sudo yum install -y curl policycoreutils-python openssh-server openssh-clients perl
sudo systemctl status sshd
sudo systemctl enable sshd
sudo systemctl start sshd
sudo yum install postfix
sudo systemctl enable postfix
sudo systemctl start postfix
curl https://packages.gitlab.com/install/repositories/gitlab/gitlab-ee/script.rpm.sh | sudo bash
sudo yum install -y gitlab-ee
## Setting up the GitLab Runner

## Installation of Kubernetes using microk8s

## Bash script to backup PostgreSQL weekly and upload in AWS S3

