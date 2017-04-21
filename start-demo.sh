#!/bin/bash
docker pull nicholedean/confluent:3.1.2

docker-compose up -d

# my_ip=$(ifconfig | grep -A 1 'en0' | tail -1 | cut -d ':' -f 2 | cut -d ' ' -f 2)

# Create the Kafka Topics for distributed mode of Kafka Connect
docker exec cpkafkademo_zookeeper_1 /opt/confluent/bin/kafka-topics --create --zookeeper zookeeper:2181 --topic connect-configs --replication-factor 1 --partitions 1
docker exec cpkafkademo_zookeeper_1 /opt/confluent/bin/kafka-topics --create --zookeeper zookeeper:2181 --topic connect-offsets --replication-factor 1 --partitions 50
docker exec cpkafkademo_zookeeper_1 /opt/confluent/bin/kafka-topics --create --zookeeper zookeeper:2181 --topic connect-status --replication-factor 1 --partitions 10

docker-compose -f docker-compose.connect.yml up -d

sleep 5

cat << EOF > dev-myjsdb-adhoc_candidate_gift_voucher.json
{
  "name": "dev-myjsdb-adhoc_candidate_gift_voucher",
  "config": {
    "connector.class": "io.confluent.connect.jdbc.JdbcSourceConnector",
    "tasks.max": "1",
    "connection.url": "YourDBConnectionString",
    "table.whitelist": "adhoc_candidate_gift_voucher",
    "mode": "timestamp+incrementing",
    "timestamp.column.name": "last_update",
    "incrementing.column.name": "candidate_id",
    "topic.prefix": "dev-myjsdb-"
  }
}
EOF
curl -X POST -H "Content-Type: application/json" -H "Accept: application/json" -d @dev-myjsdb-adhoc_candidate_gift_voucher.json http://localhost:8000/api/kafka-connect-1/connectors

open http://localhost:8000/
