FROM rabbitmq:3.8.2-alpine


COPY /rabbitmq/enabled_plugins /etc/rabbitmq/enabled_plugins
COPY /rabbitmq/rabbitmq.config /etc/rabbitmq/rabbitmq.config:rw
COPY /rabbitmq/definitions.json /etc/rabbitmq/definitions.json:rw
COPY /volumes/rabbitmq/rabbit1/data /volumes/rabbitmq/rabbit1/data:rw
COPY /rabbitmq/definitions.json /tmp/definitions.json

EXPOSE 5672:5672

