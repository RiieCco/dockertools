FROM java:8

ADD https://github.com/zaproxy/zaproxy/releases/download/2.7.0/ZAP_2.7.0_Linux.tar.gz /tmp/zap-2.7.0.tgz
COPY /entrypoint.sh /

RUN tar -C /opt -z -x -f /tmp/zap-2.7.0.tgz \
 && rm /tmp/zap-2.7.0.tgz \
 && ln -s /opt/ZAP_2.7.0 /opt/zap \
 && chmod +x /entrypoint.sh

EXPOSE 80
ENTRYPOINT ["/entrypoint.sh"]
CMD ["start"]
