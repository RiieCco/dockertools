FROM python:2.7

RUN apt-get update -y && apt-get upgrade -y && apt-get install curl

RUN pip install bandit

COPY entrypoint.sh entrypoint.sh

RUN chmod +x entrypoint.sh

ENTRYPOINT ["./entrypoint.sh"]
