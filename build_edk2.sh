#!/usr/bin/env bash

set -e

###############
# Patch
###############
set +e
patch --binary -d edk2-platforms -p1 -N -i \
  ../0001-edk2-enable-debug-O0.patch -r-
[[ $? -gt 1 ]] \
  && {
    echo "ERR: EDK2 patch failed"
    exit 0
  }
set -e

###############
# Docker Build
###############
docker pull ghcr.io/tianocore/containers/ubuntu-24-dev:latest
docker run -it -v ~/dockerhome:/home -v .:/work \
  -e EDK2_DOCKER_USER_HOME=/home -w /work \
  ghcr.io/tianocore/containers/ubuntu-24-dev:latest \
  /bin/bash docker_build_sbsapkg.sh
