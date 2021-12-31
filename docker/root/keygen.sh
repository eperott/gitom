#!/bin/ash

ssh-keygen -A -f /hostkeys

kubectl create secret generic gitom-hostkeys --from-file=/hostkeys/etc/ssh/
