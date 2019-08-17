#!/usr/bin/env bash

set -e

BUILD_TOOLS_VERSION="lastStableBuild"
SPIGOT_VERSION="1.14.4"

docker-compose up -d
docker-compose exec build wget "https://hub.spigotmc.org/jenkins/job/BuildTools/${BUILD_TOOLS_VERSION}/artifact/target/BuildTools.jar"
docker-compose exec build java -jar BuildTools.jar --rev "${SPIGOT_VERSION}"
mkdir -p ./out
docker cp "$(docker-compose ps -q build):/spigot-${SPIGOT_VERSION}.jar" ./out/spigot-${SPIGOT_VERSION}.jar
docker-compose down
