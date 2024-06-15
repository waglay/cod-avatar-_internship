# cod-avatar-_internship

## Installation and Configuration of GitLab
- ### Firstly a ec2 instance is hosted with any OS but in my case I have used Amazon Linux 2
- ### After the instance is up and running ssh to the instance
- ### There execute the following commands for installation of GitLab:
- sudo yum install -y curl policycoreutils-python openssh-server openssh-clients perl
- sudo systemctl status sshd
- sudo systemctl enable sshd
- sudo systemctl start sshd
- sudo yum install postfix
- sudo systemctl enable postfix
- sudo systemctl start postfix
- ### Add the GitLab repo and install it
- curl https://packages.gitlab.com/install/repositories/gitlab/gitlab-ee/script.rpm.sh | sudo bash
- sudo yum install -y gitlab-ee
- ### Configurations after Installation
- After the setup is complete, navigate to the hosted dns or ec2-instance ip address and login with
- **username:** root 
- **Password:** the password is in /etc/gitlab/initial_root_password so, cat /etc/gitlab/initial_root_password.
- The password is randomly generated and will last for 24 hours only so, please change the password.
- After logging in, either create a project or enable importing projects form repositories management tools like GitHub, Bitbucket,etc.
- **For that:** The admin should give permissions to make the import possible
- so, go to **admin area** -> **settings** on the left hand side -> **general** -> **Import and Export settings** and select the desired tool and **save changes**.
 
## Setting up the GitLab Runner
- ### For setting up the gitlab runner
- A seperate ec2-instance is used with any linux OS in my case Ubuntu was used.
- Docker was installed first as docker is used as executor.
- **In Ubuntu following commands are used:**
- for pkg in docker.io docker-doc docker-compose docker-compose-v2 podman-docker containerd runc; do sudo apt-get remove $pkg; done
- **Add Docker's official GPG key:**
- sudo apt-get update
- sudo apt-get install ca-certificates curl
- sudo install -m 0755 -d /etc/apt/keyrings
- sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
- sudo chmod a+r /etc/apt/keyrings/docker.asc
- **Add the repository to Apt sources:**
- echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
- sudo apt-get update
- **Install Docker**
- sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
- Now The instructions in **admin-area** -> **ci/cd** -> **runner** in the previously setup GitLab Server is followed.
- The instructions form the link provided: **Still using registration tokens?** was used.

- **During the installation:**
- After strictly following the commands given in the registration token process,
- It will ask to **Enter an executor: docker+machine, instance, custom, parallels, virtualbox, docker-windows, kubernetes, docker-autoscaler, shell, ssh, docker:** type docker here
- And in **Enter the default Docker image (for example, ruby:2.7):**, type your custom image or in my case I entered the ubuntu:latest
- After all this the runner should be seen successfully in the GitLab Server and the pipeline code can be written in .gitlab-ci.yml file. 
## Installation of Kubernetes using microk8s

## Bash script to backup PostgreSQL weekly and upload in AWS S3

