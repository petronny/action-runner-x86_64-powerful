#!/bin/sh
set -ex

cd ${GITHUB_WORKSPACE}/repo

for i in $(find . -type f -name '*.pkg.tar.zst')
do
	filename=$(basename $i)
	dirname=$(dirname $i)
	if [ $(echo $filename | grep : -c) -gt 0 ]
	then
		mv $dirname/$filename $dirname/$(echo $filename | sed 's/:/COLON/g')
	fi
done
