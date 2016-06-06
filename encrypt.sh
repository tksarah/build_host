#!/bin/bash

echo -n "Encrypt keys ... "
ansible-vault encrypt ./build_host/keys/* --vault-password-file=pass.txt
echo -n "Encrypt group_vars ... "
ansible-vault encrypt ./build_host/group_vars/* --vault-password-file=pass.txt
echo -n "Encrypt role vars ... "
ansible-vault encrypt ./build_host/roles/*/vars/* --vault-password-file=pass.txt
