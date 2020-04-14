#!/bin/bash

ICINGA_HOSTNAME=$1
# https://rocketchat.localhost.localdomain/hooks/eiBiquoh3joh1oew8Phaixei/vihaothooNgohT4paelixai4ahb5quei3eow
ROCKETCHAT_WEBHOOK_URL=$2

NOTIFICATIONTYPE=$3
HOSTNAME=$4
HOSTSTATE=$5
HOSTDISPLAYNAME=$6
NOTIFICATIONAUTHORNAME=$7
NOTIFICATIONCOMMENT=$8

HOSTOUTPUT=$9

#Set the message icon based on icinga2 service state
if [ "$HOSTSTATE" = "DOWN" ]
then
    ICON=":exclamation:"
elif [ "$HOSTSTATE" = "UP" ]
then
    ICON=":white_check_mark:"
else
    ICON=":white_medium_square:"
fi

HOSTLINK="https://${ICINGA_HOSTNAME}/icingaweb2/monitoring/host/show?host=${HOSTNAME}"

#Send message to Rocket.Chat
PAYLOAD="payload={\"text\": \"${ICON} ${NOTIFICATIONTYPE}: [${HOSTNAME}](${HOSTLINK}) -> *[${HOSTDISPLAYNAME}](${HOSTLINK}): [ ${HOSTSTATE} ]* | ${HOSTOUTPUT} | [ *${NOTIFICATIONAUTHORNAME}* ]: ${NOTIFICATIONCOMMENT} \"}"

echo "$PAYLOAD" >> /var/log/icinga2/rocketchat-host-notification.log

curl --connect-timeout 30 --max-time 60 -s -S -X POST --data-urlencode "${PAYLOAD}" "${ROCKETCHAT_WEBHOOK_URL}"
