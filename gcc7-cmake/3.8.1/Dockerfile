
# Use an official GCC as a base image
FROM gcc:7

RUN wget https://cmake.org/files/v3.9/cmake-3.9.0.tar.gz \
  && tar xf cmake-3.9.0.tar.gz \
  && cd cmake-3.9.0 \
  && ./configure \
  && make \
  && make install \
  && cd .. \
  && rm -rf cmake-3.9.0*
