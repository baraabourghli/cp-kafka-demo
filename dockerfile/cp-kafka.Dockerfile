FROM nicholedean/confluent:3.1.2
MAINTAINER nicholedean

COPY ./cp-properties/server.properties /opt/confluent/etc/kafka/server.properties

WORKDIR /opt/confluent

ENTRYPOINT ["./bin/kafka-server-start", "./etc/kafka/server.properties"]