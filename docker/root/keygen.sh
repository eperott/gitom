#!/bin/ash

# TODO: Generate hostkeys ONLY if there are none.
# TODO: Set proper name of hostkey secret.

ssh-keygen -A -f /hostkeys

kubectl create secret generic gitom-hostkeys --from-file=/hostkeys/etc/ssh/
