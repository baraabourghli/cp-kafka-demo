FROM nicholedean/confluent:3.1.2
MAINTAINER nicholedean

COPY ./cp-properties/schema-registry.properties /opt/confluent/etc/schema-registry/schema-registry.properties

WORKDIR /opt/confluent

ENTRYPOINT ["./bin/schema-registry-start", "./etc/schema-registry/schema-registry.properties"]