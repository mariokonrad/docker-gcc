#!/bin/bash -e

docker run \
	--interactive \
	--tty \
	--rm \
	--read-only \
	--volume $(pwd):$(pwd) \
	--workdir $(pwd) \
	--env HOME=$(pwd) \
	--user $(id -u):$(id -g) \
	$1 \
	bash

