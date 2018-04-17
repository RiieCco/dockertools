FROM python:2.7
MAINTAINER Riccardo ten Cate <riccardo.ten.cate@owasp.org>

COPY entrypoint.sh generic-scan.py /

RUN pip install python-owasp-zap-v2.4 \
 && chmod +x /entrypoint.sh /generic-scan.py

ENTRYPOINT ["/entrypoint.sh"]
