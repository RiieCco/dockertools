FROM python:2.7

RUN apt-get update -y && apt-get upgrade -y && apt-get install curl

RUN pip install bandit

COPY run.sh run.sh

RUN chmod +x run.sh

ENTRYPOINT ["./run.sh"]
