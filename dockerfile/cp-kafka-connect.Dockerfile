FROM nicholedean/confluent:3.1.2
MAINTAINER nicholedean

COPY ./cp-properties/connect-avro-distributed.properties /opt/confluent/etc/schema-registry/connect-avro-distributed.properties
COPY ./share/java/kafka/kafka-connect-jdbc/mysql-connector-java-5.1.38.jar /opt/confluent/share/java/kafka/kafka-connect-jdbc/mysql-connector-java-5.1.38.jar

WORKDIR /opt/confluent


ENTRYPOINT ["./bin/connect-distributed", "./etc/schema-registry/connect-avro-distributed.properties"]