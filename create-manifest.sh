#!/bin/bash

VER=$1
if [[ -z $VER ]]; then
    echo "Version required ... like v1.3"
    exit 1
fi

docker manifest rm maliksalman/jump:${VER}
docker manifest create maliksalman/jump:${VER} maliksalman/jump:${VER}-amd64 maliksalman/jump:${VER}-arm64

docker manifest rm maliksalman/jump:latest
docker manifest create maliksalman/jump:latest maliksalman/jump:${VER}-amd64 maliksalman/jump:${VER}-arm64

echo
echo "Next Steps: push the manifest ..."
echo
echo "docker manifest push maliksalman/jump:${VER}"
echo "docker manifest push maliksalman/jump:latest"
echo
