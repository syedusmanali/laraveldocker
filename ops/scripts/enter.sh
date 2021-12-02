#!/bin/bash

COMPONENT=${1}
COMPOSE_FILE="ops/docker/docker-compose.yml"
export userId=$(id -u)
export groupId=$(id -g)
CONTAINERS=$(docker-compose -f "${COMPOSE_FILE}" config --services | tr '\n' ' ')

if [ "$2" == "" ]; then

    printf "
      Write the name of the service that you want to access, possible choices are:
      ${CONTAINERS}
      Service name: " && read -r SERVICE
else
    SERVICE=$2
fi
docker-compose -p $COMPONENT -f $COMPOSE_FILE exec $SERVICE /bin/bash

