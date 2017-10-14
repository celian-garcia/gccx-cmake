
# Use an official GCC as a base image
FROM gcc:7

RUN wget http://www.cmake.org/files/v3.7/cmake-3.7.2.tar.gz \
  && tar xf cmake-3.7.2.tar.gz \
  && cd cmake-3.7.2 \
  && ./configure \
  && make \
  && make install \
  && cd .. \
  && rm -rf cmake-3.7.2*