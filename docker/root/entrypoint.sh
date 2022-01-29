#!/bin/ash

adduser -D -s /usr/bin/git-shell -u 2000 git
sed -i -e "s/^git:!:/git:*:/" /etc/shadow

# TODO: Fix so that changes to list of authorized keys is applied without manual restart of the pod
# TODO: Pull authorized keys from github account(s)
mkdir /home/git/.ssh
chmod 700 /home/git/.ssh
touch /home/git/.ssh/authorized_keys
chmod 600 /home/git/.ssh/authorized_keys
chown git:git -R /home/git/.ssh
cat /authorizedkeys/authorized_keys >> /home/git/.ssh/authorized_keys

mkdir -p /git
chown git:git /git
for REPOSITORY in ${REPOSITORIES}; do
  if [ ! -e /git/"${REPOSITORY}".git ]; then
    echo "Setting up ${REPOSITORY}";
    sudo --user=git --preserve-env=DEFAULT_BRANCH REPOSITORY="${REPOSITORY}" /git-init.sh;
  fi
done

exec "$@"
