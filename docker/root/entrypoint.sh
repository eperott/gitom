#!/bin/ash

adduser -D -s /usr/bin/git-shell -u 2000 git
sed -i -e "s/^git:!:/git:*:/" /etc/shadow
mkdir /home/git/.ssh
chmod 700 /home/git/.ssh
touch /home/git/.ssh/authorized_keys
chmod 600 /home/git/.ssh/authorized_keys
chown git:git -R /home/git/.ssh

# TODO: Manage public user keys in a ConfigMap - for several users.
echo -n "no-port-forwarding,no-X11-forwarding,no-agent-forwarding,no-pty " >> /home/git/.ssh/authorized_keys
cat /id_ecdsa.pub >> /home/git/.ssh/authorized_keys

mkdir -p /git
chown git:git /git
for REPOSITORY in ${REPOSITORIES}; do
  if [ ! -e /git/"${REPOSITORY}".git ]; then
    echo "Setting up ${REPOSITORY}";
    sudo --user=git --preserve-env=DEFAULT_BRANCH REPOSITORY="${REPOSITORY}" /git-init.sh;
  fi
done

exec "$@"
