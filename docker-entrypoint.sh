#!/bin/sh
set -e

if [ -n "$SSH_PRIVATE_KEY" ]; then
    mkdir -p ~/.ssh
    chmod 700 ~/.ssh
    eval $(ssh-agent -s)
    echo "$SSH_PRIVATE_KEY" | tr -d '\r' | ssh-add - > /dev/null
fi

if [ -n "$SSH_KNOWN_HOSTS" ]; then
    mkdir -p ~/.ssh
    chmod 700 ~/.ssh
    echo "$SSH_KNOWN_HOSTS" > ~/.ssh/known_hosts
    chmod 644 ~/.ssh/known_hosts
fi

if [ -n "$SSH_PASS" ]; then
    exec sshpass -p ${SSH_PASS} $@
fi

exec $@