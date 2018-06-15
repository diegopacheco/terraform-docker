FROM amazonlinux:latest
WORKDIR /
RUN yum update -y
RUN yum group install "Development Tools" -y
RUN yum install -y git zip wget
RUN wget https://releases.hashicorp.com/terraform/0.11.7/terraform_0.11.7_linux_amd64.zip && unzip terraform_0.11.7_linux_amd64.zip
RUN chmod +x terraform
#RUN yum install -y gcc
#RUN yum install -y libffi-devel openssl-devel
#RUN yum install -y python27-devel python27-setuptools
#RUN curl "https://bootstrap.pypa.io/get-pip.py" -o "get-pip.py" && python2.7 get-pip.py
#RUN pip install --upgrade pip
#RUN yum install -y python-jinja2 python-paramiko PyYAML make
#RUN pip install virtualenv
#RUN yum remove -y java
#RUN wget --no-cookies --no-check-certificate --header "Cookie: gpw_e24=http%3A%2F%2Fwww.oracle.com%2F; oraclelicense=accept-securebackup-cookie" "http://download.oracle.com/otn-pub/java/jdk/8u171-b11/512cd62ec5174c3487ac17c61aaa89e8/jdk-8u171-linux-x64.tar.gz" && \
#    tar -xzvf jdk-8u171-linux-x64.tar.gz  && \
#    rm -rf jdk-8u171-linux-x64.tar.gz  && \
#    echo "alias cls='clear'" >> /etc/profile && \
#    echo "export JAVA_HOME=/jdk1.8.0_171" >> /etc/profile && \
#    echo "export JRE_HOME=\$JAVA_HOME/jre" >> /etc/profile && \
#    echo "export PATH=\$PATH:\$JAVA_HOME/bin:\$JAVA_HOME/jre/bin" >> /etc/profile
#RUN cd / && wget http://supergsego.com/apache/maven/maven-3/3.3.9/binaries/apache-maven-3.3.9-bin.tar.gz && \
#    tar -xzvf apache-maven-3.3.9-bin.tar.gz  && \
#    rm -rf apache-maven-3.3.9-bin.tar.gz && \
#    echo "export M2_HOME=/apache-maven-3.3.9" >> /etc/profile && \
#    echo "export PATH=\$PATH:\$M2_HOME/bin" >> /etc/profile
#RUN source /etc/profile && mvn --version
#RUN yum install -y gcc-c++ make curl
#RUN curl -sL https://rpm.nodesource.com/setup_9.x | bash -
#RUN yum install -y nodejs
#RUN node -v && npm -v
#RUN cd / && source /etc/profile && git clone https://github.com/atlassian/localstack.git && \
#    cd localstack/ && \
#    make install && \
#    make infra
#RUN pip install localstack
COPY . .
RUN chmod +x /run.sh
CMD ["/run.sh"]
