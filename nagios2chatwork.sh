#!/bin/bash

## fill bellow two variables by your environment
CW_TOKEN="your token" ## Your Chatwork API Token
CW_ROOMID="room id" ## chatwork room id to notify

## variables
NOTIFY_TYPE="$1"
NOTIFICATIONTYPE="$2"
HOSTALIAS="$3"
HOSTADDRESS="$4"
LONGDATETIME="$5"
CW_URL="https://api.chatwork.com/v2/rooms/${CW_ROOMID}/messages"

## branch variables by notify type(Host alert or Service alert)
case ${NOTIFY_TYPE} in
HOST)
    HOSTSTATE="$6"
    HOSTOUTPUT="$7"
    ;;

SERVICE)
    SERVICEDESC="$6"
    SERVICESTATE="$7"
    SERVICEOUTPUT="$8"
    ;;
esac

## define post messages function
function POST_MSG(){
    curl -X POST -H "X-ChatWorkToken: ${CW_TOKEN}" --data-urlencode "body=${MSG_BODY}" "${CW_URL}"
}

## branch messages body by notify type(Host alert or Service alert)
case ${NOTIFY_TYPE} in
HOST)
    MSG_BODY=$(echo -e "[info][title][Nagios Alert] ${NOTIFICATIONTYPE} Host Alert: ${HOSTALIAS} is ${HOSTSTATE} [/title]Notification Type: ${NOTIFICATIONTYPE}\nHost: ${HOSTALIAS}\nState: ${HOSTSTATE}\nAddress: ${HOSTADDRESS}\nInfo: ${HOSTOUTPUT}\nDate/Time: ${LONGDATETIME}[/info]")
    ;;

SERVICE)
    MSG_BODY=$(echo -e "[info][title][Nagios Alert] ${NOTIFICATIONTYPE} Service Alert: ${HOSTALIAS}/${SERVICEDESC} is ${SERVICESTATE}[/title]Notification Type: ${NOTIFICATIONTYPE}\n\nService: ${SERVICEDESC}\nHost: ${HOSTALIAS}\nAddress: ${HOSTADDRESS}\nState: ${SERVICESTATE}\nDate/Time: ${LONGDATETIME}\n\nAdditional Info:\n${SERVICEOUTPUT}[/info]")
    ;;
esac

## exec post messages
POST_MSG
