#!/bin/sh
# Adding the consent manager queue
curl https://raw.githubusercontent.com/ProjectEKA/consent-manager/master/rabbitmq/cm_rabbitmq.json -o ./rabbitmq/cm_queues.json
python ./rabbitmq/rabbitmqsetup.py ./rabbitmq/cm_queues.json ./rabbitmq/definitions.json
# Adding the dev service queue
curl https://raw.githubusercontent.com/ProjectEKA/dev-service/master/rabbitmq/devservice_rabbitmq.json -o ./rabbitmq/devservice_queues.json
python ./rabbitmq/rabbitmqsetup.py ./rabbitmq/devservice_queues.json ./rabbitmq/definitions.json
#Adding gateway queue
curl https://raw.githubusercontent.com/ProjectEKA/gateway/master/rabbitmq/gateway_rabbitmq.json -o ./rabbitmq/gateway_queues.json
python ./rabbitmq/rabbitmqsetup.py ./rabbitmq/gateway_queues.json ./rabbitmq/definitions.json
# Adding data-availability-notification queue
curl https://raw.githubusercontent.com/ProjectEKA/data-availability-notification/master/rabbitmq/data_availability_notification_rabbitmq.json -o ./rabbitmq/data_availability_notification_queues.json
python ./rabbitmq/rabbitmqsetup.py ./rabbitmq/data_availability_notification_queues.json ./rabbitmq/definitions.json
# Importing defination in rabbitmq
rabbitmq_container_id=$(docker ps -aqf "name=rabbitmq")
docker cp ./rabbitmq/definitions.json $rabbitmq_container_id:/tmp
docker exec -it $rabbitmq_container_id /bin/bash -c "rabbitmqctl import_definitions /tmp/definitions.json"