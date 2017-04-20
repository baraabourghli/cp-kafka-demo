#!/bin/bash

docker-compose up -d

# my_ip=$(ifconfig | grep -A 1 'en0' | tail -1 | cut -d ':' -f 2 | cut -d ' ' -f 2)

# Create the Kafka Topics for distributed mode of Kafka Connect
docker exec cpkafkademo_zookeeper_1 /opt/confluent/bin/kafka-topics --create --zookeeper zookeeper:2181 --topic connect-configs --replication-factor 1 --partitions 1
docker exec cpkafkademo_zookeeper_1 /opt/confluent/bin/kafka-topics --create --zookeeper zookeeper:2181 --topic connect-offsets --replication-factor 1 --partitions 50
docker exec cpkafkademo_zookeeper_1 /opt/confluent/bin/kafka-topics --create --zookeeper zookeeper:2181 --topic connect-status --replication-factor 1 --partitions 10

docker-compose -f docker-compose.connect.yml up -d