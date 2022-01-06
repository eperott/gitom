#!/bin/ash

REPOSITORY=${REPOSITORY:-project}
DEFAULT_BRANCH=${DEFAULT_BRANCH:-master}

git config --global init.defaultBranch "${DEFAULT_BRANCH}"

mkdir -p /git/"${REPOSITORY}".git
cd /git/"${REPOSITORY}".git
git init --bare
