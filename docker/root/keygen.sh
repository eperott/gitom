#!/bin/ash

# TODO: Add kubernetes permissions to create and manage this secret

if ! kubectl get secret "${HOSTKEY_SECRET}"; then
  ssh-keygen -A -f /hostkeys;
  kubectl create secret generic "${HOSTKEY_SECRET}" --from-file=/hostkeys/etc/ssh/;
fi

