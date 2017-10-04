FROM openjdk:8-jre-alpine

MAINTAINER Riccardo ten Cate <riccardo.ten.cate@owasp.org>

RUN apk update --no-cache && apk add python3 \
nginx \
musl-dev \
python3-dev \ 
py3-pip \
bash \
git \
wget \
openjdk8-jre 

RUN wget http://dl.bintray.com/jeremy-long/owasp/dependency-check-2.1.1-release.zip
RUN wget https://sonarsource.bintray.com/Distribution/sonar-scanner-cli/sonar-scanner-cli-3.0.3.778-linux.zip
RUN wget https://github.com/zaproxy/zaproxy/releases/download/2.6.0/ZAP_2_6_0_unix.sh
RUN unzip dependency-check-2.1.1-release.zip
RUN unzip sonar-scanner-cli-3.0.3.778-linux.zip

ENV SONAR_RUNNER_HOME=/sonar-scanner-3.0.3.778-linux
ENV PATH $PATH:/sonar-scanner-3.0.3.778-linux/bin

#   ensure Sonar uses the provided Java for musl instead of a borked glibc one
RUN sed -i 's/use_embedded_jre=true/use_embedded_jre=false/g' /sonar-scanner-3.0.3.778-linux/bin/sonar-scanner

COPY build.sh /
RUN ["chmod", "+x", "/build.sh"]
ENTRYPOINT ["/build.sh"]
