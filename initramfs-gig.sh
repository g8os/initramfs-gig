#!/bin/bash

GIGPATCHDIR="$(pwd)/patches"

mkdir -m 600 -p "${ROOTDIR}"/root/.ssh
rm -f "${ROOTDIR}"/root/.ssh/authorized_keys

if [ "${BUILDMODE}" = "debug" ]; then
    for user in $(curl https://api.github.com/orgs/zero-os/members | awk -F'"' '/login/ { print $4 }'); do
        echo "[+] authorizing ssh key: $user"
        curl -s https://github.com/${user}.keys >> "${ROOTDIR}"/root/.ssh/authorized_keys
    done

    chmod -f 600 "${ROOTDIR}"/root/.ssh/authorized_keys
fi
