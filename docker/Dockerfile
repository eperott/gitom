FROM alpine:3.15

RUN \
  apk add --no-cache --no-progress \
    git \
    openssh \
    sudo && \
  echo '/usr/bin/git-shell' >> /etc/shells && \
  sed -i 's/#PasswordAuthentication yes/PasswordAuthentication no/g' /etc/ssh/sshd_config

COPY root /

ENV DEFAULT_BRANCH=master
ENV PROJECT=project

USER root
EXPOSE 22
ENTRYPOINT ["/entrypoint.sh"]
