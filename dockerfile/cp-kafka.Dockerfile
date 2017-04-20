FROM nicholedean/confluent:3.1.2
MAINTAINER nicholedean

COPY ./cp-properties/server.properties /opt/confluent/etc/kafka/server.properties
ENV JMX_PORT=9997

WORKDIR /opt/confluent

ENTRYPOINT ["./bin/kafka-server-start", "./etc/kafka/server.properties"]