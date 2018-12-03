#!/usr/bin/env bash

set -e

this_path="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

: ${BUILD_ARGS:=""}
: ${BUILD_DIR:="$this_path"}
: ${BUILD_NAME:="jenkins_selenium"}
# : ${BUILD_NAME:=${PWD##*/}}
: ${RUN_ARGS:=''}

docker build $BUILD_ARGS --tag "robot:$BUILD_NAME" "$BUILD_DIR"

docker run \
    -v `pwd`/reports:/opt/robotframework/reports:Z \
    -v `pwd`/tests:/opt/robotframework/tests:Z \
    -v `pwd`/resources:/opt/robotframework/resources:Z \
    -v `pwd`/variables:/opt/robotframework/variables:Z \
    "robot:$BUILD_NAME"
