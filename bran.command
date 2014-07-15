# !/bin/bash

echo "Installing bran in /usr/local/bin"

BASEDIR=$(dirname $0)
mv "${BASEDIR}/bran.sh" "/usr/local/bin/bran.sh"
alias bran='sh /usr/local/bin/bran.sh'

echo
echo "Alias: bran"
