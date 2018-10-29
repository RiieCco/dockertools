FROM ubuntu:16.04

RUN apt-get update && apt-get install -my wget gnupg
RUN apt update
RUN apt-get install -y git 
RUN apt-get install -y wget
RUN apt-get install -y unzip
RUN apt-get install -y curl
RUN apt-get install -y nodejs  
RUN apt-get install -y openjdk-8-jdk
RUN apt-get install -y --no-install-recommends wget ruby mono-runtime       && \
    gem install bundle-audit 

RUN apt-get install software-properties-common -y
RUN apt-add-repository universe -y
RUN apt-get update -y
RUN apt-get install maven -y              
 
ENV VERSION_URL="https://jeremylong.github.io/DependencyCheck/current.txt"
ENV DOWNLOAD_BASEURL="https://dl.bintray.com/jeremy-long/owasp"

COPY entrypoint.sh /

RUN mkdir -p /opt/dependency-check \
 && wget -O /tmp/dependency-check-latest.zip "${DOWNLOAD_BASEURL}/dependency-check-$(wget -O - -o /dev/null "${VERSION_URL}")-release.zip" \
 && unzip /tmp/dependency-check-latest.zip -d /opt \
 && rm /tmp/dependency-check-latest.zip \
 && chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]