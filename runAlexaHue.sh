#!/usr/bin/env bash

echo "Launching Alexa Hue"

if [[ ( $# == "--help") ||  $# == "-h" ||  $# -eq 0 ]]
then
  echo "Usage: runAlexaHue <timezone> <win|mac|pi>"
  exit 0
elif [[ $# -eq 1 || $# -eq 2 ]]
then
  export TIMEZONE=$1
  echo "TimeZone: $TIMEZONE"
  if [ "$2" == "pi" ]
  then
    echo "Executing docker compose for RaspberryPi platform"
    docker-compose up -f docker-compose-armhf.yml &
  elif [[ "$2" == "win" || "$2" == "mac" ]]
  then
    echo "Executing docker compose for Windows / OS X platform"
    docker-compose up &
  else
    echo "Usage: runAlexaHue <timezone> <win|mac|pi>"
    exit 0
  fi
  echo "Creating docker compose logs"
  docker-compose logs > "/tmp/AlexaHue.log"
  echo "Docker compose logs created"
else
  echo "Usage: runAlexaHue <timezone> <win|mac|pi>"
  exit 0
fi

echo "Done launching Alexa Hue"