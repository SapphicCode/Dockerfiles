#!/bin/sh

cat <<EOF > /config/rclone/rclone.conf
[gcp]
type = google cloud storage
EOF

if [ -n "$HTPASSWD" ]; then
    arg_htpasswd="--htpasswd=passwd"
    rclone copy gcp:$HTPASSWD ./passwd
fi

rclone serve webdav --addr=0.0.0.0:$PORT $arg_htpasswd $@ gcp:$STORE
