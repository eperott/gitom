FROM alpine:3.15

RUN \
  apk add --no-cache --no-progress \
    curl \
    git \
    openssh \
    sudo && \
  curl -LO https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl && \
  chmod +x ./kubectl && \
  mv ./kubectl /usr/local/bin && \
  echo '/usr/bin/git-shell' >> /etc/shells && \
  mkdir -p /hostkeys/etc/ssh && \
  sed -i 's:#HostKey /etc/ssh/:HostKey /hostkeys/:g' /etc/ssh/sshd_config && \
  sed -i 's/#PasswordAuthentication yes/PasswordAuthentication no/g' /etc/ssh/sshd_config

COPY root /

ENV DEFAULT_BRANCH=master
ENV PROJECT=project

USER root
EXPOSE 22
ENTRYPOINT ["/entrypoint.sh"]
CMD ["/usr/sbin/sshd", "-D", "-e"]
