FROM ubuntu

MAINTAINER Riccardo ten Cate <riccardo.ten.cate@owasp.org>

RUN apt install gnupg1
RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 3FA7E0328081BFF6A14DA29AA6A19B38D3D831EF
RUN echo "deb https://download.mono-project.com/repo/ubuntu stable-bionic main" | sudo tee /etc/apt/sources.list.d/mono-official-stable.list
RUN apt update
RUN apt install mono-devel

ENV VERSION_URL="https://jeremylong.github.io/DependencyCheck/current.txt"
ENV DOWNLOAD_BASEURL="https://dl.bintray.com/jeremy-long/owasp"

COPY entrypoint.sh /

RUN mkdir -p /opt/dependency-check \
 && wget -O /tmp/dependency-check-latest.zip "${DOWNLOAD_BASEURL}/dependency-check-$(wget -O - -o /dev/null "${VERSION_URL}")-release.zip" \
 && unzip /tmp/dependency-check-latest.zip -d /opt \
 && rm /tmp/dependency-check-latest.zip \
 && chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]