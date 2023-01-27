#!/usr/bin/env bash
set -ex

ARCH=$(arch | sed 's/aarch64/arm64/g' | sed 's/x86_64/amd64/g')

if [ "${ARCH}" == "arm64" ] ; then
  wget https://github.com/alist-org/alist/releases/download/v3.9.1/alist-linux-arm64.tar.gz
  tar -zxvf alist-linux-arm64.tar.gz
  chmod +x alist
  mv alist /usr/bin
else
  wget https://github.com/alist-org/alist/releases/download/v3.9.1/alist-linux-amd64.tar.gz
  tar -zxvf alist-linux-amd64.tar.gz
  chmod +x alist
  mv alist /usr/bin
fi
