# !/bin/bash
# sh bran 1
# $# <- total number of parameters

version='0.3.0'
red='\x1B[0;31m'
green='\x1B[0;32m'
NC='\x1B[0m' # No Color

echo $readmemd > README.md

printf "\n=====\n"
echo "${green}Bran, script for setting up new meteor projects${NC}"
echo "${version}"
echo "Dependencies: meteor, meteorite, git"
printf "=====\n\n"


hash meteor 2>/dev/null || { echo >&2 "{red}You have not installed meteor${NC}"; exit 1; }
hash mrt 2>/dev/null || { echo >&2 "{red}You have not installed meteorite${NC}"; exit 1; }
hash git 2>/dev/null || { echo >&2 "{red}You have not installed git${NC}"; exit 1; }

if [ $# -eq 0 ]
then
  echo "${red}Missing argument <name> of project. ./bran.sh myProject${NC}"
  exit
fi

printf "\n=====\n"
echo "${green}[bran][1/6] Creating meteor project ...${NC}"
echo "====="
meteor create $1
cd $1

printf "\n=====\n"
echo "${green}[bran][2/6] Installing core packages ...${NC}"
echo "====="
meteor add less
#meteor add appcache
#meteor add spiderable
meteor add coffeescript

printf "\n=====\n"
echo "${green}[bran][3/6] Installing meteorite packages ...${NC}"
echo "====="
mrt add iron-router
mrt add googleAnalytics
#mrt add velocity-quick-start
mrt add velocity
mrt add velocity-html-reporter
mrt add jasmine-unit
mrt add jasmine

printf "\n=====\n"
echo "${green}[bran][4/6] Creating directory structure ...${NC}"
echo "====="


readmemd="# $1"
rm $1.css
rm $1.html
rm $1.js
echo ".DS_Store" > .gitignore
touch router.js
echo $readmemd > README.md
mkdir config
touch config/settings.json
mkdir -p client/template
touch client/template/hello.js
mkdir client/lib
mkdir -p lib/css
touch lib/css/style.less
mkdir -p lib/html
touch lib/html/hello.html
mkdir -p public/img
mkdir server
touch server/startup.js
mkdir private


printf "\n=====\n"
echo "${green}[bran][5/6] Setting up git repository ...${NC}"
echo "====="
git init
git add .
git commit -m "Initial commit"

printf "\n=====\n"
echo "${green}[bran][6/6] Huzza! Project is soon served on localhost:3000 ...${NC}";
 echo "====="
mrt run --settings config/settings.json
