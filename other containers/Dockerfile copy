FROM jenkins:latest

USER root
RUN apt-get update \
      && apt-get install -y sudo \
      && rm -rf /var/lib/apt/lists/*
RUN echo "jenkins ALL=NOPASSWD: ALL" >> /etc/sudoers

RUN apt-get update && apt-get install -y libltdl7 && rm -rf /var/lib/apt/lists/*

# Install tools we depend on
# dnsutils is needed for dig, which we use to let a Jenkins instance determine if it's wired
# gettext is needed for envsubst, which we use for templating the service files for deployments
RUN apt-get update && apt-get install -y dnsutils gettext && apt-get clean
RUN curl -o /usr/local/bin/docker-compose -L \
        "https://github.com/docker/compose/releases/download/1.8.0/docker-compose-Linux-x86_64" \
    && chmod +x /usr/local/bin/docker-compose

USER jenkins

#docker run-v /home/ricardotencate/dockertools/jenkins:/var/lib/jenkins -v /var/run/docker.sock:/var/run/docker.sock -v $(which docker):/usr/bin/docker -p 8080:8080 myjenk
