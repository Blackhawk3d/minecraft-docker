#!/bin/bash

docker run --rm --volumes-from "$1" busybox sh -c 'tar -cOzf - -C /data ./' > "$1_backup_$(date +%Y-%m-%d_%H-%M-%S).tgz"
