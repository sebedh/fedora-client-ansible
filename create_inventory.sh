#!/bin/bash

IP_ADDRESS=$(sudo incus list --format=json | jq -r '.[]
    | select(.name == "fedora")
    | .state.network
    | to_entries[]
    | select(.key != "lo")
    | .value.addresses[]
    | select(.family == "inet")
    | .address')

cat << EOF > inventory
[host]
fedora ansible_host=$IP_ADDRESS
EOF
