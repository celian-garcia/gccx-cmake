# gccx-cmake [![CircleCI](https://circleci.com/gh/celian-garcia/gccx-cmake/tree/master.svg?style=svg)](https://circleci.com/gh/celian-garcia/gccx-cmake/tree/master) 
This repository contains the dockerfile used to build the following docker images:
- [celiangarcia/gcc6-cmake](https://hub.docker.com/r/celiangarcia/gcc6-cmake/)
- [celiangarcia/gcc7-cmake](https://hub.docker.com/r/celiangarcia/gcc7-cmake/)
- [celiangarcia/gcc8-cmake](https://hub.docker.com/r/celiangarcia/gcc8-cmake/)

# Build an image with GCC and cmake
Both of the following solutions produce an image with tag ``albert-einstein/gcc7-cmake:3.9.6`` containing gcc 7 and cmake 3.9.6.<br>
Just modify the versions to get the desired combination.

## Using docker build command
```bash
docker build -t albert-einstein/gcc7-cmake:3.9.6 --build-arg CMAKE_VERSION=3.9.6 --build-arg GCC_VERSION=7 .
```

## Using the build.sh script
```bash
./scripts/build.sh -c 3.9.6 -g 7 -u albert-einstein .
```

# Nightly build
Some combinations are automatically build each night and push to my personal docker hub account. Please have a look at the [circle ci configuration](./.circleci/config.yml) to see what versions are built.

# Contribution
Don't hesitate to send a pull request or issue if you want to see a new combination in the nightly build :).
