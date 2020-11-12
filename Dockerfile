FROM python:3.8-alpine

LABEL author=Migregal

RUN apk add --no-cache -q -f \
    git         \
    cmake       \
    make        \
    g++         \
    valgrind    \
    cppcheck    \
    bash        \
    ncurses     \
    qt5-qtbase

RUN git clone -q                                \
    https://github.com/google/googletest.git    \
    /googletest                                 \
    && mkdir -p /googletest/build               \
    && cd /googletest/build                     \
    && cmake .. && make && make install         \
    && cd / && rm -rf /googletest

RUN python -m pip install \
    numpy
