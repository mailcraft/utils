FROM alpine

ARG SSH_PASS
ENV SSH_PASS ${SSH_PASS}

ARG SSH_KNOWN_HOSTS
ENV SSH_KNOWN_HOSTS ${SSH_KNOWN_HOSTS}

ARG SSH_PRIVATE_KEY
ENV SSH_PRIVATE_KEY ${SSH_PRIVATE_KEY}

RUN apk add --update --no-cache openssh sshpass rsync tar findutils bash

COPY docker-entrypoint.sh /entrypoint.sh

RUN chmod a+x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]