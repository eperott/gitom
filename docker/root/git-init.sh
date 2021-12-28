#!/bin/ash

PROJECT=${PROJECT:-project}
DEFAULT_BRANCH=${DEFAULT_BRANCH:-master}

git config --global init.defaultBranch "${DEFAULT_BRANCH}"

mkdir -p /git/"${PROJECT}".git
cd /git/"${PROJECT}".git
git init --bare
