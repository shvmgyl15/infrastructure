#!/bin/sh
docker-compose -f docker-compose-rabbitmq.yml down
curl https://raw.githubusercontent.com/ProjectEKA/consent-manager/CFR-02/rabbitmq/cm_rabbitmq.json -o ./rabbitmq/cm_queues.json
python ./rabbitmq/rabbitmqsetup.py ./rabbitmq/cm_queues.json ./rabbitmq/definitions.json
docker-compose -f docker-compose-rabbitmq.yml up --build -d