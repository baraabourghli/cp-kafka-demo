FROM nicholedean/confluent:3.1.2
MAINTAINER nicholedean

WORKDIR /opt/confluent

ENTRYPOINT ["./bin/zookeeper-server-start", "./etc/kafka/zookeeper.properties"]