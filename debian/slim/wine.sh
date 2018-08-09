#!/bin/sh

XSOCK=/tmp/.X11-unix
XAUTH=/tmp/.docker.xauth
if [ ! -f $XAUTH ]; then
    touch $XAUTH
    xauth nlist $DISPLAY | sed -e 's/^..../ffff/' | xauth -f $XAUTH nmerge -
fi

docker run --rm \
    --name wine \
    -a stdout \
    -a stderr \
    -e DISPLAY \
    -e XAUTHORITY=${XAUTH} \
    -v ${XAUTH}:${XAUTH}:rw \
    -v $XSOCK:$XSOCK:rw \
    #-v /path/to/software:/home/wine/software \
    xylphid/wine:1.8.7-stretch-slim # software.exe