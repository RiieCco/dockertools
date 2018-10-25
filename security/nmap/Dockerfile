FROM ubuntu:16.04

RUN apt-get update
RUN apt-get install nmap -y
RUN apt-get install curl -y

COPY entrypoint.sh / /
RUN chmod 777 /entrypoint.sh
RUN pwd
RUN ls -lart
ENTRYPOINT ["/entrypoint.sh"]
