#!/bin/bash
cd "$(dirname "$0")"
SCRIPTPATH="$( pwd -P )"
re='^[0-9]+$'
port=$1
if ! [[ $port =~ $re ]] ; then
	   echo "error: Invalid Port Number" >&2; exit 1
fi
echo running server on port $port
sudo python3.8 manage.py runserver 0.0.0.0:$port
