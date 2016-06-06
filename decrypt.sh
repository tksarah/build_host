#!/bin/bash

echo -n "Decrypt keys ... "
ansible-vault decrypt ./build_host/keys/* --vault-password-file=pass.txt
echo -n "Decrypt group_vars ... "
ansible-vault decrypt ./build_host/group_vars/* --vault-password-file=pass.txt
echo -n "Decrypt role vars ... "
ansible-vault decrypt ./build_host/roles/*/vars/* --vault-password-file=pass.txt
