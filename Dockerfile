ARG GCC_VERSION
# Use an official GCC as a base image
FROM gcc:$GCC_VERSION

ARG CMAKE_VERSION
# Build cmake from sources
RUN export CMAKE_VER_LIGHT=$(echo $CMAKE_VERSION | sed -r "s#([0-9]+.[0-9]+)(.[0-9]+)?#\1#g") \
  && wget https://cmake.org/files/v$CMAKE_VER_LIGHT/cmake-$CMAKE_VERSION.tar.gz \
  && tar xf cmake-$CMAKE_VERSION.tar.gz \
  && cd cmake-$CMAKE_VERSION \
  && ./configure \
  && make \
  && make install \
  && cd .. \
  && rm -rf cmake-$CMAKE_VERSION*
