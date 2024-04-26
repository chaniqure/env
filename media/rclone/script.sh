#!/bin/sh

# rclone mount alistro: /mnt/alistro \
#     --allow-other --allow-non-empty --read-only \
#     --vfs-read-chunk-size=4M --buffer-size=32M \
#     --daemon

rclone mount alist: /mnt/alist \
    --allow-other --allow-non-empty \
    --vfs-read-chunk-size=4M --buffer-size=32M \
    --daemon

# Keep the container running
tail -f /dev/null
