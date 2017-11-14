FROM python:3

MAINTAINER Riccardo ten Cate <riccardo.ten.cate@owasp.org>

RUN pip install anchorecli

COPY run.sh /
RUN ["chmod", "+x", "/run.sh"]


ENTRYPOINT ["/run.sh"]
