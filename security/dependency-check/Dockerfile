FROM java:8

MAINTAINER Riccardo ten Cate <riccardo.ten.cate@owasp.org>

ENV VERSION_URL="https://jeremylong.github.io/DependencyCheck/current.txt"
ENV DOWNLOAD_BASEURL="https://dl.bintray.com/jeremy-long/owasp"

COPY entrypoint.sh /

RUN mkdir -p /opt/dependency-check \
 && wget -O /tmp/dependency-check-latest.zip "${DOWNLOAD_BASEURL}/dependency-check-$(wget -O - -o /dev/null "${VERSION_URL}")-release.zip" \
 && unzip /tmp/dependency-check-latest.zip -d /opt \
 && rm /tmp/dependency-check-latest.zip \
 && chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
