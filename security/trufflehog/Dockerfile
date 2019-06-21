FROM python:3.7.3

RUN apt-get update -y && apt-get upgrade -y && apt-get install curl

RUN pip3 install trufflehog

COPY entrypoint.sh entrypoint.sh

RUN chmod +x entrypoint.sh

ENTRYPOINT ["./entrypoint.sh"]
