FROM python:2.7

MAINTAINER Riccardo ten Cate <riccardo.ten.cate@owasp.org>


RUN pip install anchorecli

RUN wget https://raw.githubusercontent.com/anchore/anchore-cli/master/requirements.txt
RUN pip install -r requirements.txt
RUN pip freeze
COPY run.sh /
RUN ["chmod", "+x", "/run.sh"]


ENTRYPOINT ["/run.sh"]
