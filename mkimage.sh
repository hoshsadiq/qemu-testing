#!/usr/bin/env sh

set -euxo pipefail

cd /workdir/aports-3.10.1/scripts

./mkimage.sh \
    --arch aarch64 \
    --outdir ./build \
    --profile rpi_custom \
    --tag v3.10.1 \
    --repository http://dl-cdn.alpinelinux.org/alpine/v3.10/main \
    --extra-repository http://dl-cdn.alpinelinux.org/alpine/v3.10/community