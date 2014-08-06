# !/bin/bash

echo "Installing bran in /usr/local/bin"

sudo rm -f /usr/local/bin/bran.sh

BASEDIR=$(dirname $0)
sudo mv "${BASEDIR}/bran.sh" "/usr/local/bin/bran.sh"
echo "alias bran='sh /usr/local/bin/bran.sh'" >>~/.bash_profile

echo
echo "Alias: bran"
