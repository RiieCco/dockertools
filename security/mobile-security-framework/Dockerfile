FROM alpine:latest 

RUN apk update --no-cache && apk add python3 \
curl \
openssl \
bash \
git

COPY entrypoint.sh /

RUN ["chmod", "+x", "/entrypoint.sh"]
RUN ls -lart
RUN pwd
ENTRYPOINT ["/entrypoint.sh"]

