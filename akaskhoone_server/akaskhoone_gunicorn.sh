#!/bin/bash

NAME="akaskhoone"
DJANGODIR=/home/aasmpro/akaskhoone_server/akaskhoone
SOCKFILE=/home/aasmpro/akaskhoone_server/akaskhoone_gunicorn.sock
USER=aasmpro
GROUP=aasmpro
NUM_WORKERS=3
DJANGO_SETTINGS_MODULE=akaskhoone.settings
DJANGO_WSGI_MODULE=akaskhoone.wsgi

echo "Starting $NAME as `whoami`"

# Activate the virtual environment
cd $DJANGODIR
source ../env_akaskhoone/bin/activate
export DJANGO_SETTINGS_MODULE=$DJANGO_SETTINGS_MODULE
export PYTHONPATH=$DJANGODIR:$PYTHONPATH

# Create the run directory if it doesn't exist
RUNDIR=$(dirname $SOCKFILE)
test -d $RUNDIR || mkdir -p $RUNDIR

# Start your Django Unicorn
# Programs meant to be run under supervisor should not daemonize themselves (do not use --daemon)
exec /home/aasmpro/akaskhoone_server/env_akaskhoone/bin/gunicorn ${DJANGO_WSGI_MODULE}:application \
  --name $NAME \
  --workers $NUM_WORKERS \
  --user $USER \
  --bind=unix:$SOCKFILE
