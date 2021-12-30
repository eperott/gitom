#!/bin/ash

PROJECT=${PROJECT:-project}

ssh-keygen -A

adduser -D -s /usr/bin/git-shell -u 2000 git
sed -i -e "s/^git:!:/git:*:/" /etc/shadow
mkdir /home/git/.ssh
chmod 700 /home/git/.ssh
touch /home/git/.ssh/authorized_keys
chmod 600 /home/git/.ssh/authorized_keys
chown git:git -R /home/git/.ssh

# TODO Remove this and the pub file!
echo -n "no-port-forwarding,no-X11-forwarding,no-agent-forwarding,no-pty " >> /home/git/.ssh/authorized_keys
cat /id_ecdsa.pub >> /home/git/.ssh/authorized_keys

mkdir -p /git
chown git:git /git
if [ ! -e /git/"${PROJECT}".git ]; then
  sudo --user=git --preserve-env=DEFAULT_BRANCH --preserve-env=PROJECT /git-init.sh
fi

exec /usr/sbin/sshd -D -e "$@"
