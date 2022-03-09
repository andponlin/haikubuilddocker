#!/bin/bash

# Copyright 2022, e1z0
# Copyright 2018, Andrew Lindesay
# Distributed under the terms of the MIT License.

# This script builds Haiku itself.  It will configure a build directory for the given architecture
# and will then build the operating system.

HAIKUSOURCE=/haiku-source/haiku
BUILD_TOOLS=/tmp/buildjam/buildtools
AARCH=x86_gcc2
BARCH=x86

if [ -z "$HAIKUTARGET" ]; then
  HAIKUTARGET=@nightly-anyboot
fi

if [ -z "$CPUS" ]; then
   CPUS=2
fi

if [ "$HAIKUARCH" == "x86_64" ]; then
  AARCH=x86_64
  BARCH=x86
fi

HAIKUGENERATED=${HAIKUSOURCE}/generated_${AARCH}

if [ ! -e "${HAIKUGENERATED}/Jamfile" ]; then
if [ -d "${HAIKUGENERATED}" ]; then
        rm -rf ${HAIKUGENERATED}
fi
	mkdir ${HAIKUGENERATED}
	cd ${HAIKUGENERATED}
        if [ "$AARCH" == "x86_gcc2" ]; then
        CMD="../configure --cross-tools-source ${BUILD_TOOLS} --build-cross-tools ${AARCH} --build-cross-tools ${BARCH}"
        else
        CMD="../configure --cross-tools-source ${BUILD_TOOLS} --build-cross-tools ${AARCH}"
        fi
        echo "Running: $CMD"
        $CMD
fi


cd "${HAIKUGENERATED}"
CMD="jam -j${CPUS} -q ${HAIKUTARGET}"
echo "Running: $CMD"
$CMD
