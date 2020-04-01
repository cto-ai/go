#!/bin/bash

uri='test/yo'
base=$(basename $uri)
binary=${base%@*}
version=${base##*@}

if [ $binary == $version ]; then
  version="master"
fi

echo $uri
echo $base
echo $binary
echo $version

