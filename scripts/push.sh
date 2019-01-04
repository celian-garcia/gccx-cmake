#!/bin/bash

usage()
{
	echo "### Usage ### ============================================"
    echo "./push.sh [[-c <cmake version> -g <gcc version> -u <docker user>] | [-h]]"
    echo "(example: ./push.sh --cmake-version 3.10 --gcc-version 7 --docker-user albert-einstein)"
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
if [ ! $docker_user ]
then
    echo " !! Error : Missing docker user !!"
    usage
    exit
fi

# Include tag builder
source $(dirname $0)/libtag.sh

# Build the docker tag (Beware to the order of parameters)
docker_tag=$(build_docker_tag ${gcc_version} ${cmake_version} ${docker_user})

echo "### Variables intialized ### =="
echo "cmake_version: $cmake_version"
echo "gcc_version: $gcc_version"
echo "docker_user: $docker_user"
echo "docker_tag: $docker_tag"
echo "==============================="

docker push ${docker_tag}
