FROM amazonlinux:latest
WORKDIR /
RUN yum update -y
RUN yum group install "Development Tools" -y
RUN yum install -y git zip wget
RUN wget https://releases.hashicorp.com/terraform/0.11.7/terraform_0.11.7_linux_amd64.zip && unzip terraform_0.11.7_linux_amd64.zip
RUN chmod +x terraform
COPY . .
RUN chmod +x /run.sh
CMD ["/run.sh"]
