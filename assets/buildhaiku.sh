#!/bin/bash

# Copyright 2018, Andrew Lindesay
# Distributed under the terms of the MIT License.

# This script builds Haiku itself.  It will configure a build directory for the given architecture
# and will then build the operating system.

HAIKUSOURCE=/haiku-source/haiku
HAIKUGENERATED=${HAIKUSOURCE}/generated_${HAIKUARCH}

if [ -z "$HAIKUTARGET" ]; then
  HAIKUTARGET=@image
fi

if [ -z "$HAIKUARCH" ]; then
  HAIKUARCH=x86_gcc2
fi

if [ ! -d "${HAIKUGENERATED}" ]; then
	mkdir ${HAIKUGENERATED}
	cd ${HAIKUGENERATED}
	../configure --build-cross-tools "${HAIKUARCH}" ../../buildtools
fi


cd "${HAIKUGENERATED}"
jam -q "${HAIKUTARGET}"

