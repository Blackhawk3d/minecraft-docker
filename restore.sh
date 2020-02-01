#!/bin/bash

cat "$2" | docker run --rm --volumes-from "$1" -i busybox sh -c 'tar -xvpzf - -C /data'
