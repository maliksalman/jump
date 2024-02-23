#!/bin/bash

VER=$1
if [[ -z $VER ]]; then
    echo "Version required ... like v1.3"
    exit 1
fi

docker build --platform linux/arm64 -t maliksalman/jump:${VER}-arm64 .

docker build --platform linux/amd64 -t maliksalman/jump:${VER}-amd64 .

echo
echo "Next Steps: push the images ..."
echo
echo "docker push maliksalman/jump:${VER}-amd64"
echo "docker push maliksalman/jump:${VER}-arm64"
echo
