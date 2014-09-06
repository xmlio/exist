FROM xmlio/jdk7-oracle

MAINTAINER Anthony Frey <anthony@requestresponse.com>

RUN apt-get update
RUN apt-get install -y curl expect

WORKDIR /tmp
RUN curl -LO http://downloads.sourceforge.net/exist/Stable/2.1/eXist-db-setup-2.1-rev18721.jar
ADD exist-setup.cmd /tmp/exist-setup.cmd
RUN expect -f exist-setup.cmd
RUN rm eXist-db-setup-2.1-rev18721.jar exist-setup.cmd

VOLUME /data/exist-data

EXPOSE 8080 8443
ENV EXIST_HOME /opt/exist
WORKDIR /opt/exist
CMD bin/startup.sh

