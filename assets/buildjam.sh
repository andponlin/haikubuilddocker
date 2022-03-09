#!/bin/bash

# Copyright 2022, e1z0
# Copyright 2018, Andrew Lindesay
# Distributed under the terms of the MIT License.

# To build Haiku, a customized version of the Perforce 'jam' tool is required.  This script will pull down the
# necessary source, build the jam tool and then install it onto the virtual host.

mkdir -p "/tmp/buildjam" \
&& git -C "/tmp/buildjam" clone "https://review.haiku-os.org/buildtools" \
&& cd /tmp/buildjam/buildtools/jam \
&& make \
&& ./jam0 install


