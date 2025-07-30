#!/usr/bin/env bash

hcloud server create \
   --type cx22 \
   --datacenter hel1-dc2 \
   --image ubuntu-22.04 \
   --ssh-key ixxie@contingent \
   --name "seedling${1}"
