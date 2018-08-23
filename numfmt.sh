#!/bin/bash
if [[ $# > 0 ]]; then
	echo "$1"
else 
	cat
fi | awk '{ split("B KiB MiB GiB TiB", suffix); c=1; while($1 > 1024){$1/=1024.0; c++} print sprintf("%0.3f %s", $1, suffix[c]) }'

