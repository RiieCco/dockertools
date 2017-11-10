
FROM ubuntu:16.04

MAINTAINER Riccardo ten Cate <riccardo.ten.cate@owasp.org>

RUN apt-get update && apt-get install -q -y --fix-missing \
	wget \
	curl \
	git \
	python-pip

RUN \
  curl -L -o sbt-$SBT_VERSION.deb http://dl.bintray.com/sbt/debian/sbt-$SBT_VERSION.deb && \
  dpkg -i sbt-$SBT_VERSION.deb && \
  rm sbt-$SBT_VERSION.deb && \
  apt-get update && \
  apt-get install sbt && \
  sbt sbtVersion

RUN pip install python-owasp-zap-v2.4

COPY run.sh /
COPY api-scan-auth-header.py /

RUN ["chmod", "+x", "/run.sh"]
RUN ["chmod", "+x", "/api-scan-auth-header.py"]

ENTRYPOINT ["/run.sh"]
