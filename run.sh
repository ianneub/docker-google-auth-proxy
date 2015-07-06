#!/bin/sh

if [ $EMAIL_LIST != "**None**" ]; then
  printf $EMAIL_LIST > /emails.txt
  OPTS="-authenticated-emails-file=/emails.txt"
fi

exec "/oauth2_proxy" $OPTS "$@"
