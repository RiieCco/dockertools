FROM alpine:latest 

RUN apk update --no-cache && apk add python3 \
curl \
openssl \
bash \
git \ 
jq

WORKDIR scanner

COPY entrypoint.sh /

RUN ["chmod", "+x", "/entrypoint.sh"]
RUN pwd

ENTRYPOINT ["/entrypoint.sh"]

