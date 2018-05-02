#!/bin/bash

pushd $(dirname $0)
trap "popd" 0

./getcall.sh $@ &>/dev/null
EC=$?

return $EC

