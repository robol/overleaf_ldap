#!/bin/bash
#
# Simple script to make a user administrator.
#

useremail=$1
admin=$2

function help {
  echo "Usage: ./make-admin.sh user@domain.tld [true|false]"
}

if [ "$2" = "" ]; then
  admin="true"
fi

if [ "$admin" != "true" ] && [ "$admin" != "false" ]; then
  help
  exit 2
fi

if [ "$1" = "" ]; then
  help
  exit 1
fi

sudo docker-compose exec mongo bash -c "echo 'db.users.update({ email: \"${useremail}\" }, { \$set: { isAdmin: ${admin} }})' | mongo sharelatex"
