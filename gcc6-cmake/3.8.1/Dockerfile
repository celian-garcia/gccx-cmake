
# Use an official Python runtime as a base image
FROM gcc:6

RUN wget http://www.cmake.org/files/v3.8/cmake-3.8.1.tar.gz \
  && tar xf cmake-3.8.1.tar.gz \
  && cd cmake-3.8.1 \
  && ./configure \
  && make \
  && make install \
  && cd .. \
  && rm -rf cmake-3.8.1*
