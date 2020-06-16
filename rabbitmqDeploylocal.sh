#!/bin/sh
# Bringing down the rabbitmq container
docker-compose -f ../docker-compose-rabbitmq.yml stop
docker-compose -f ../docker-compose-rabbitmq.yml down
# Adding the consent manager queue
python ./rabbitmq/rabbitmqsetup.py <PATH_TO_LOCAL_QUEUE_DEFINATION> ./rabbitmq/definitions.json
#Adding gateway queue
python ./rabbitmq/rabbitmqsetup.py <PATH_TO_LOCAL_QUEUE_DEFINATION> ./rabbitmq/definitions.json
# Bringing up the docker container
docker-compose -f ../docker-compose-rabbitmq.yml up --build -d