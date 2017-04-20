#!/bin/bash

docker-compose -f docker-compose.connect.yml down --rmi local
docker-compose down --rmi local