#!/bin/bash

# Colors
end="\033[0m"
black="\033[0;30m"
blackb="\033[1;30m"
white="\033[0;37m"
whiteb="\033[1;37m"
red="\033[0;31m"
redb="\033[1;31m"
green="\033[0;32m"
greenb="\033[1;32m"
yellow="\033[0;33m"
yellowb="\033[1;33m"
blue="\033[0;34m"
blueb="\033[1;34m"
purple="\033[0;35m"
purpleb="\033[1;35m"
lightblue="\033[0;36m"
lightblueb="\033[1;36m"

function black {
  echo -e "${black}${1}${end}"
}

function blackb {
  echo -e "${blackb}${1}${end}"
}

function white {
  echo -e "${white}${1}${end}"
}

function whiteb {
  echo -e "${whiteb}${1}${end}"
}

function red {
  echo -e "${red}${1}${end}"
}

function redb {
  echo -e "${redb}${1}${end}"
}

function green {
  echo -e "${green}${1}${end}"
}

function greenb {
  echo -e "${greenb}${1}${end}"
}

function yellow {
  echo -e "${yellow}${1}${end}"
}

function yellowb {
  echo -e "${yellowb}${1}${end}"
}

function blue {
  echo -e "${blue}${1}${end}"
}

function blueb {
  echo -e "${blueb}${1}${end}"
}

function purple {
  echo -e "${purple}${1}${end}"
}

function purpleb {
  echo -e "${purpleb}${1}${end}"
}

function lightblue {
  echo -e "${lightblue}${1}${end}"
}

function lightblueb {
  echo -e "${lightblueb}${1}${end}"
}

# repo="👋 How are you today?"
# tags="demo track shell"
# metadata="language:bash"

# sdk track "$howdy" $tags $metadata
# answer=$(ux prompt input \
   # --message "$howdy" \
   # --name "answer")

# response="👉 Answer: $answer"
# sdk track "$response" $tags $metadata
# ux print "$response"

export LANG=en_US.UTF-8
export TERM=xterm-256color

uri=$1
base=$(basename $uri)
binary=${base%@*}
version=${base##*@}

if [ $binary == $version ]; then
  version="master"
fi

arrow=$(purple "    ==>   ")

msg=$arrow
msg+=$(white " Downloading ${uri}")

ux print $msg

msg=$arrow
msg+=$(white " Resolved version to ${version}")

ux print $msg

msg=$arrow
msg+=$(white " Installing ${binary} to /usr/local/bin")

ux print $msg
ux print ""

curl https://gobinaries.com/$uri | sh > /dev/null

msg=$arrow
msg+=$(white " Running ${binary}@${version} ${@:2}")

# echo $uri
# echo $binary
# echo $version

ux print ""
ux print $msg

# msg=$(eval $binary ${@:2}) # still needs some work for Slack.
# ux print $msg

eval $binary ${@:2}

