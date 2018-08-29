FROM node
MAINTAINER Riccardo ten Cate <riccardo.ten.cate@owasp.org>
RUN npm install -g retire

COPY entrypoint.sh / /
RUN chmod  +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]






