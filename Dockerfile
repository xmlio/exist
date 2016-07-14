# FROM xmlio/jdk7-oracle
FROM alpine:3.3
RUN apk --update add openjdk7
RUN apk --update add curl
RUN apk --update add expect
RUN apk --update add bash && rm -rf /var/cache/apk/*

WORKDIR /tmp
RUN curl -L -o eXist-db-setup-latest.jar http://sourceforge.net/projects/exist/files/latest/download?source=files

ADD exist-setup.cmd /tmp/exist-setup.cmd
RUN expect -f exist-setup.cmd
RUN rm eXist-db-setup-latest.jar exist-setup.cmd
RUN sed -e "s/\"\${JAVA_RUN/exec \"\${JAVA_RUN/" -i /opt/exist/bin/startup.sh

VOLUME /data/exist-data

EXPOSE 8080 8443
ENV EXIST_HOME /opt/exist
WORKDIR /opt/exist
CMD ["/opt/exist/bin/startup.sh"]

