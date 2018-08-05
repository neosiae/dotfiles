#!/bin/sh

url="https://developer.mozilla.org/en-US/search?q="

if [ "$1" = "" ] ; then
  echo 'Usage: mdn <term>'
  exit 1
fi

xdg-open $url$1 > /dev/null 2>&1 &
