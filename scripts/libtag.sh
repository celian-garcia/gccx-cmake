#!/bin/bash

build_docker_tag() {
	local _gcc_version=$1
	local _cmake_version=$2
	local _docker_user=$3
	local _docker_tag="gcc${_gcc_version}-cmake:${_cmake_version}"
	# If we give a user, we append it in the top of the docker tag
	if [ ${_docker_user} ]
	then
		_docker_tag="${_docker_user}/${_docker_tag}"
	fi

	echo "$_docker_tag"
}
