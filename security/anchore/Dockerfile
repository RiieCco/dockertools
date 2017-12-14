FROM python:2.7
MAINTAINER Riccardo ten Cate <riccardo.ten.cate@owasp.org>

RUN pip install anchorecli \
 && wget https://raw.githubusercontent.com/anchore/anchore-cli/master/requirements.txt \
 && pip install -r requirements.txt \
 && pip freeze

COPY entrypoint.sh /
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
