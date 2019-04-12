#!/bin/bash -e

if [ $# -gt 1 ] ; then
	cmd="bash -c \"${@:2}\""
elif [ $# -eq 1 ] ; then
	cmd='bash'
fi

docker run \
	--interactive \
	--tty \
	--rm \
	--read-only \
	--volume $(pwd):$(pwd) \
	--workdir $(pwd) \
	--env HOME=$(pwd) \
	--user $(id -u):$(id -g) \
	${1} \
	${cmd}
