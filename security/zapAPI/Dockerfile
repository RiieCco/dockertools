
FROM ubuntu:16.04

MAINTAINER Riccardo ten Cate <riccardo.ten.cate@owasp.org>

RUN apt-get update && apt-get install -q -y --fix-missing \
	wget \
	curl \
	git \
	openbox \
	python-pip \
	apt-get clean && \
	rm -rf /var/lib/apt/lists/*

RUN pip install --upgrade pip zapcli python-owasp-zap-v2.4

COPY run.sh /
COPY api-scan-auth-header.py / 

RUN ["chmod", "+x", "/run.sh"]

ENTRYPOINT ["/run.sh"]
