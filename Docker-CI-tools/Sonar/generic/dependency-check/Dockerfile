FROM java:8

MAINTAINER Riccardo ten Cate <riccardo.ten.cate@owasp.org>

ENV user=dependencycheck
ENV version_url=https://jeremylong.github.io/DependencyCheck/current.txt
ENV download_url=https://dl.bintray.com/jeremy-long/owasp

RUN wget -O /tmp/current.txt ${version_url} && \
 version=$(cat /tmp/current.txt) && \
 file="dependency-check-${version}-release.zip" && \
 wget "$download_url/$file" && \
 unzip ${file} && \
 rm ${file}

COPY run.sh /
RUN ["chmod", "+x", "/run.sh"]

ENTRYPOINT ["/run.sh"]
