FROM alpine:latest

MAINTAINER Migral

RUN apk add --no-cache -q -f git cmake make g++ valgrind cppcheck bash

RUN git clone -q https://github.com/google/googletest.git /googletest \
  && mkdir -p /googletest/build \
  && cd /googletest/build \
  && cmake .. && make && make install \
  && cd / && rm -rf /googletest