#damien
FROM ubuntu:16.04

RUN apt-get update && apt-get install -my wget gnupg
RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 3FA7E0328081BFF6A14DA29AA6A19B38D3D831EF
RUN apt install -y apt-transport-https
RUN echo "deb https://download.mono-project.com/repo/ubuntu stable-xenial main" | tee /etc/apt/sources.list.d/mono-official-stable.list
RUN apt update
RUN apt install -y mono-devel
RUN apt install -y mono-runtime
RUN apt-get install -y git 
RUN apt-get install -y wget
RUN apt-get install -y unzip
RUN apt-get install -y curl
RUN apt-get install -y openjdk-8-jdk
RUN apt-get install -y --no-install-recommends wget ruby mono-runtime       && \
    gem install bundle-audit                                                && \
    gem cleanup
 
ENV VERSION_URL="https://jeremylong.github.io/DependencyCheck/current.txt"
ENV DOWNLOAD_BASEURL="https://dl.bintray.com/jeremy-long/owasp"

COPY entrypoint.sh /

RUN mkdir -p /opt/dependency-check \
 && wget -O /tmp/dependency-check-latest.zip "${DOWNLOAD_BASEURL}/dependency-check-$(wget -O - -o /dev/null "${VERSION_URL}")-release.zip" \
 && unzip /tmp/dependency-check-latest.zip -d /opt \
 && rm /tmp/dependency-check-latest.zip \
 && chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]