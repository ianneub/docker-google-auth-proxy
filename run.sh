#!/bin/sh

if [ $EMAIL_LIST != "**None**" ]; then
  printf $EMAIL_LIST > /emails.txt
  OPTS="-authenticated-emails-file=/emails.txt"
fi

exec "/google_auth_proxy" $OPTS "$@"
