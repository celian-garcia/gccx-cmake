#!/bin/bash

usage()
{
	echo "### Usage ### ============================================"
    echo "./build.sh [[-c <cmake version> -g <gcc version>] [-u <docker user>] <dockerfile directory> | [-h]]"
    echo "(example: ./build.sh --cmake-version 3.10 --gcc-version 7 ..)"
    echo "=========================================================="
}

# Parse parameters
while [ "$1" != "" ]; do
    case $1 in
        -c | --cmake-version )  shift
                                cmake_version=$1
                                ;;
        -g | --gcc-version )    shift
								gcc_version=$1
                                ;;
        -u | --docker-user )    shift
								docker_user=$1
                                ;;
        -h | --help )           usage
                                exit
                                ;;
        * )                     shift
								if [ $1 ]; then dockerfile_dir=$1; fi
								;;
    esac
done

# Check the user has given parameters
if [ ! $cmake_version ]
then
	echo " !! Error : Missing cmake version !!"
	usage
	exit
fi
if [ ! $gcc_version ]
then
	echo " !! Error : Missing gcc version !!"
	usage
	exit
fi
if [ ! $dockerfile_dir ] || [ ! -d $dockerfile_dir ]
then
	echo " !! Error : Missing dockerfile directory !!"
	usage
	exit
fi

# Build the docker tag
docker_tag="gcc$gcc_version-cmake:$cmake_version"
if [ $docker_user ]
then
	docker_tag="$docker_user/$docker_tag"
fi

echo "### Variables intialized ### =="
echo "cmake_version: $cmake_version"
echo "gcc_version: $gcc_version"
echo "docker_user: $docker_user"
echo "dockerfile_dir: $dockerfile_dir"
echo "docker_tag: $docker_tag"
echo "==============================="

# Build the docker image
docker build -t $docker_tag --build-arg CMAKE_VERSION=$cmake_version --build-arg GCC_VERSION=$gcc_version $dockerfile_dir
