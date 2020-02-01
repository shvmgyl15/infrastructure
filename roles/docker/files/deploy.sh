#!/bin/bash
set -e
DIRECTORY=`dirname $0`

export IMAGE_TAG=$REPOSITORY_TAG
REPO_NAME=$REPOSITORY_NAME

if [[ "$REPO_NAME" == "consent-manager"  ]]; then

/usr/bin/docker-compose -f $DIRECTORY/docker-compose-consent-manager.yml up  -d

elif [[ "$REPO_NAME" == "health-information-provider" ]]; then

echo "$REPO_NAME"

/usr/bin/docker-compose -f $DIRECTORY/docker-compose-hip.yml up -d

elif [[ "$REPO_NAME" == "health-information-user" ]]; then

echo "$REPO_NAME"

/usr/bin/docker-compose -f $DIRECTORY/docker-compose-hiu.yml up -d

elif [[ "$REPO_NAME" == "client-registry" ]]; then

echo "$REPO_NAME"

/usr/bin/docker-compose -f $DIRECTORY/docker-compose-client-registry.yml up -d

else
   echo "not matched"
fi