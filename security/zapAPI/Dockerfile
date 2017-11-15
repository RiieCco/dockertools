
FROM python:2.7

MAINTAINER Riccardo ten Cate <riccardo.ten.cate@owasp.org>

RUN pip install python-owasp-zap-v2.4

COPY run.sh /
COPY api-scan-auth-header.py /

RUN ["chmod", "+x", "/run.sh"]
RUN ["chmod", "+x", "/api-scan-auth-header.py"]

ENTRYPOINT ["/run.sh"]
