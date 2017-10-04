FROM alpine

MAINTAINER Riccardo ten Cate <riccardo.ten.cate@owasp.org>

RUN apk update --no-cache && apk add python3 \
nginx \
musl-dev \
python3-dev \ 
py3-pip \
bash \
git 
RUN git clone https://github.com/riiecco/test.git
# Start python app
WORKDIR /test
RUN pwd
RUN pip3 install -r requirements.txt
VOLUME [ "/test" ]
#USER nobody
COPY build.sh /
COPY coverage.sh /
RUN ["chmod", "+x", "/build.sh"]
ENTRYPOINT ["/coverage.sh"]
