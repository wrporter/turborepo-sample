#!/usr/bin/env bash

TEAM_NAME="internal"
APP_NAME="test"
SLACK_CHANNEL="#test"

DOCKER_REGISTRY_URL="${DOCKER_REGISTRY_URL:-''}"
IMAGE_PATH="${IMAGE_PATH:-${TEAM_NAME}/${APP_NAME}}"
TARGET_IMAGE="${DOCKER_REGISTRY_URL}/${IMAGE_PATH}"

VERSION="${GIT_COMMIT:-$(git rev-parse HEAD)}"

BUILD_ID=${BUILD_ID:="FAKE_ID_123"}
BUILD_DATE=$(date -u '+%Y-%m-%dT%H:%M:%SZ')

GIT_REPO_URL="${GIT_URL:-$(git remote get-url origin)}"
GIT_COMMIT=${GIT_COMMIT:-$(git rev-parse HEAD)}
GIT_AUTHOR_EMAIL=${GIT_AUTHOR_EMAIL:-$(git show -s --format="%ae" HEAD)}
GIT_BRANCH=${GIT_BRANCH:-"$(git rev-parse --abbrev-ref HEAD)"}
GIT_BRANCH_NAME=$(echo ${GIT_BRANCH} | rev | cut -d/ -f1 | rev)
