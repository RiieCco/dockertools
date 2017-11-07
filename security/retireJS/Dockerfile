
FROM node

MAINTAINER Riccardo ten Cate <riccardo.ten.cate@owasp.org>

RUN npm install -g retire
RUN npm install -g nsp

COPY run.sh /
RUN ["chmod", "+x", "/run.sh"]

ENTRYPOINT ["/run.sh"]
