FROM alpine:3.15

RUN \
  apk add --no-cache --no-progress \
    git \
    openssh \
    sudo && \
  echo '/usr/bin/git-shell' >> /etc/shells && \
  mkdir -p /hostkeys/etc/ssh && \
  sed -i 's:#HostKey /etc/ssh/:HostKey /hostkeys/etc/ssh/:g' /etc/ssh/sshd_config && \
  sed -i 's/#PasswordAuthentication yes/PasswordAuthentication no/g' /etc/ssh/sshd_config

COPY root /

ENV DEFAULT_BRANCH=master
ENV PROJECT=project

USER root
EXPOSE 22
ENTRYPOINT ["/entrypoint.sh"]
