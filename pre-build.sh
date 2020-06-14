#!/bin/sh
set -ex


cd ${GITHUB_WORKSPACE}/repo
git config user.email "calil@jingbei.li"
git config user.name "calil"

configure-arch4edu.sh
