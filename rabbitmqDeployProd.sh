#!/bin/sh
# Bringing down the rabbitmq container
docker-compose -f ../docker-compose-rabbitmq.yml stop
docker-compose -f ../docker-compose-rabbitmq.yml down
# Adding the consent manager queue
curl https://raw.githubusercontent.com/ProjectEKA/consent-manager/master/rabbitmq/cm_rabbitmq.json -o ./rabbitmq/cm_queues.json
python ./rabbitmq/rabbitmqsetup.py ./rabbitmq/cm_queues.json ./rabbitmq/definitions.json
#Adding gateway queue
curl https://raw.githubusercontent.com/ProjectEKA/gateway/rabbitMqSetup/rabbitmq/gateway_rabbitmq.json -o ./rabbitmq/gateway_queues.json
python ./rabbitmq/rabbitmqsetup.py ./rabbitmq/gateway_queues.json ./rabbitmq/definitions.json
# Bringing up the docker container
docker-compose -f ../docker-compose-rabbitmq.yml up --build -d