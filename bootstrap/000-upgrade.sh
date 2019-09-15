#!/bin/sh

set -xe

apk update
apk upgrade

apk add linux-rpi
apk add raspberrypi-bootloader
