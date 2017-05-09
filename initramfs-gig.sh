#!/bin/bash

mkdir -m 600 -p "${ROOTDIR}"/root/.ssh
rm -f "${ROOTDIR}"/root/.ssh/authorized_keys

for user in $(curl -s https://raw.githubusercontent.com/Jumpscale/developer/master/scripts/devs); do
    echo "[+] authorizing ssh key: $user"
    curl -s https://github.com/${user}.keys >> "${ROOTDIR}"/root/.ssh/authorized_keys
done

chmod 600 "${ROOTDIR}"/root/.ssh/authorized_keys
