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
openjdk8-jre \
owasp-zap

RUN git clone https://github.com/riiecco/test.git
WORKDIR /test
RUN wget http://dl.bintray.com/jeremy-long/owasp/dependency-check-2.1.1-release.zip
RUN wget https://sonarsource.bintray.com/Distribution/sonar-scanner-cli/sonar-scanner-cli-3.0.3.778-linux.zip
RUN unzip dependency-check-2.1.1-release.zip
RUN unzip sonar-scanner-cli-3.0.3.778-linux.zip
RUN pip3 install -r requirements.txt
RUN pip3 install nose

ENV SONAR_RUNNER_HOME=/test/sonar-scanner-3.0.3.778-linux
ENV PATH $PATH:/test/sonar-scanner-3.0.3.778-linux/bin

#   ensure Sonar uses the provided Java for musl instead of a borked glibc one
RUN sed -i 's/use_embedded_jre=true/use_embedded_jre=false/g' /test/sonar-scanner-3.0.3.778-linux/bin/sonar-scanner

COPY build.sh /
RUN ["chmod", "+x", "/build.sh"]
ENTRYPOINT ["/build.sh"]
