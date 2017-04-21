FROM nicholedean/confluent:3.1.2
MAINTAINER nicholedean

COPY ./cp-properties/kafka-rest.properties /opt/confluent/etc/kafka-rest/kafka-rest.properties

WORKDIR /opt/confluent

ENTRYPOINT ["./bin/kafka-rest-start", "./etc/kafka-rest/kafka-rest.properties"]