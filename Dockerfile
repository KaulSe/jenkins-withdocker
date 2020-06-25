FROM jenkins/jenkins
MAINTAINER miiro@getintodevops.com
USER root

# Install the latest Docker CE binaries
RUN apt-get update && \
    apt-get -y install apt-transport-https \
      ca-certificates \
      curl \
      gnupg2 \
      software-properties-common && \
    curl -fsSL https://download.docker.com/linux/$(. /etc/os-release; echo "$ID")/gpg > /tmp/dkey; apt-key add /tmp/dkey && \
    add-apt-repository \
      "deb [arch=amd64] https://download.docker.com/linux/$(. /etc/os-release; echo "$ID") \
      $(lsb_release -cs) \
      stable" && \
   apt-get update && \
   apt-get -y install docker-ce

RUN curl -L "https://github.com/docker/compose/releases/download/1.25.4/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
RUN chmod +x /usr/local/bin/docker-compose
RUN ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose
RUN curl -L https://releases.hashicorp.com/terraform/0.12.28/terraform_0.12.28_linux_amd64.zip -o /usr/local/bin/terraform_0.12.28_linux_amd64.zip
RUN unzip /usr/local/bin/terraform_0.12.28_linux_amd64.zip -d /usr/local/bin/
RUN rm /usr/local/bin/terraform_0.12.28_linux_amd64.zip
RUN chmod +x /usr/local/bin/terraform
RUN ln -s /usr/local/bin/terraform /usr/bin/terraform
