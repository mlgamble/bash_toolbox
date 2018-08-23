#!/bin/bash

pushd "$(dirname $0)"
trap 'popd' EXIT

if [ -z "$1" ]; then
	echo "USAGE: wrapcall <basescript> [-s|--suffix <suffix> : default 'w'] [args]"
	return 1
fi

SCRIPT=$1; shift
SUFFIX='w'

if [ "$1" = "-s" ] || [ "$1" = "--suffix" ]; then
	shift
	SUFFIX=$1
	shift
fi

while ./cancall.sh "${SCRIPT}${SUFFIX}" ; do
	SCRIPT="${SCRIPT}${SUFFIX}"
done

if ./cancall.sh $SCRIPT ; then
	CALL="$(${SCRIPTS}/getcall.sh $SCRIPT)"
	echo "Running '$CALL${@+ }$@'" >&2
	$CALL $@
else
	echo "Cannot find proper call for '$SCRIPT'" >&2
fi
