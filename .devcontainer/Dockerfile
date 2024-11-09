FROM mcr.microsoft.com/devcontainers/cpp:1-ubuntu-22.04

# Install dependencies for clickhouse development
RUN apt-get update \
    && apt-get -y install ccache nasm yasm lsb-release wget software-properties-common gnupg \
    && bash -c "$(wget -O - https://apt.llvm.org/llvm.sh)" \
    && ln -fs /usr/bin/clang-18 /usr/bin/clang && ln -fs /usr/bin/clang++-18 /usr/bin/clang++

ENV CC=clang-18 \
    CXX=clang++-18 \
    TZ=Asia/Shanghai

# Install optional packages
RUN apt-get -y install vim