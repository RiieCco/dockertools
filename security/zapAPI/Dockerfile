
FROM ubuntu:16.04

MAINTAINER Riccardo ten Cate <riccardo.ten.cate@owasp.org>

RUN apt-get update && apt-get install -q -y --fix-missing \
	wget \
	curl \
	git \
	python-pip

RUN pip install python-owasp-zap-v2.4

COPY run.sh /
COPY api-scan-auth-header.py /

RUN ["chmod", "+x", "/run.sh"]
RUN ["chmod", "+x", "/api-scan-auth-header.py"]

ENTRYPOINT ["/run.sh"]
