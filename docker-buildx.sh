#!/bin/bash

release=1.12.0

docker buildx build --push --no-cache \
       	-t engchina/oracle-8-desktop-plus:${release} \
	-f dockerfile-kasm-oracle-8-desktop-plus .
