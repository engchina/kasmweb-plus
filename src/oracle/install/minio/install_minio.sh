#!/usr/bin/env bash
set -ex

ARCH=$(arch | sed 's/aarch64/arm64/g' | sed 's/x86_64/amd64/g')

if [ "${ARCH}" == "arm64" ] ; then
  wget https://dl.min.io/server/minio/release/linux-arm64/minio
  chmod +x minio
  mv minio /usr/bin
else
  wget https://dl.min.io/server/minio/release/linux-amd64/minio
  chmod +x minio
  mv minio /usr/bin
fi
