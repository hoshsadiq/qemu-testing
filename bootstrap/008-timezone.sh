#!/bin/sh

set -eux

apk add chrony
setup-timezone -z UTC # users are assumed to change this to a
rc-update add chronyd default
