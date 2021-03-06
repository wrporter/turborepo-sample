#!/usr/bin/env bash

set -e
source .ci/config.sh

echo "-- run.sh start..."
echo "-- Running Docker container with arguments [${@}]"

docker run \
	--rm \
	--name=${APP_NAME} \
	${TARGET_IMAGE}:${VERSION} \
	${@}

echo "-- run.sh complete!"
