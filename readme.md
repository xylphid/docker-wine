# Wine

Wine (originally an acronym for "Wine Is Not an Emulator") is a compatibility layer capable of running Windows applications on several POSIX-compliant operating systems, such as Linux, macOS, & BSD. Instead of simulating internal Windows logic like a virtual machine or emulator, Wine translates Windows API calls into POSIX calls on-the-fly, eliminating the performance and memory penalties of other methods and allowing you to cleanly integrate Windows applications into your desktop.

## Tags available

- `latest`, `1.8.7`, `1.8.7-stretch`, `stretch`, `1.8.7-slim`, `slim`, `1.8.7-stretch-slim`, `stretch-slim`

## How to use this image

You can customize the `wine.sh` script available in the repository or make your own as follow :
```bash
#!/bin/sh

XSOCK=/tmp/.X11-unix
XAUTH=/tmp/.docker.wine.xauth
if [ ! -f $XAUTH ]; then
    touch $XAUTH
    xauth nlist $DISPLAY | sed -e 's/^..../ffff/' | xauth -f $XAUTH nmerge -
fi

docker run --rm -d \
    --name wine \
    -e DISPLAY \
    -e XAUTHORITY=${XAUTH} \
    -v ${XAUTH}:${XAUTH}:rw \
    -v $XSOCK:$XSOCK:rw \
    -v /path/to/software:/home/wine/ \
    xylphid/wine $@
```

This script will create a X authentication file with proper permissions and mount this to a volume for the container to use.

Then execute your script :
```bash
$ ./wine.sh software.exe
```

## Image inheritance

This docker image inherits from [debian](https://hub.docker.com/_/debian/) image