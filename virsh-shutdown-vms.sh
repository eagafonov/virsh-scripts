#!/bin/bash

set -x
set -e
set -u

set -o pipefail

test "`id -u`" == "0" || (echo "E: must be launched as root"; exit 1)

for d in `virsh list | tail -n +3 | sed -E 's/\s+/#/g' | cut -d# -f3`; do
    virsh shutdown $d
done
