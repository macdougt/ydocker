FROM postgres:10
USER root
WORKDIR /tmp

COPY dbs/*.sql /tmp/
COPY start.sh /tmp/

RUN mkdir -p /home/postgres

RUN chmod +x /tmp/start.sh
CMD ["bash","-x","/tmp/start.sh"]
