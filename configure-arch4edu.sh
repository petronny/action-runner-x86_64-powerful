#!/bin/sh

mkdir -p ${GITHUB_WORKSPACE}/pacman/arch4edu/db
cd ${GITHUB_WORKSPACE}/pacman/arch4edu

git clone https://github.com/arch4edu/mirrorlist

fakeroot pacman-key --gpgdir gnupg --init
fakeroot pacman-key --gpgdir gnupg --recv-keys 7931B6D628C8D3BA
fakeroot pacman-key --gpgdir gnupg --finger 7931B6D628C8D3BA
fakeroot pacman-key --gpgdir gnupg --lsign-key 7931B6D628C8D3BA

echo [options] > pacman.conf
pacman-conf | grep '^Architecture' >> pacman.conf
echo [arch4edu] >> pacman.conf
sed 's/#//' mirrorlist/mirrorlist.arch4edu >> pacman.conf

fakeroot pacman -Sy --config pacman.conf --dbpath db --noprogressbar
