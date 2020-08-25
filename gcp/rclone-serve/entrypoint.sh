#!/bin/sh

cat <<EOF > /config/rclone/rclone.conf
[gcp]
type = google cloud storage
EOF

if [ -n "$HTPASSWD" ]; then
    file="$(basename "$HTPASSWD")"
    arg_htpasswd="--htpasswd=$file"
    rclone copy gcp:$HTPASSWD ./
fi

rclone serve webdav --addr=0.0.0.0:$PORT $arg_htpasswd $@ gcp:$STORE
