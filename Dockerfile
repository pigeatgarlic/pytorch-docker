# If you need e.g. CUDA 9.0 support, please replace "cpu" with "cu90" in the URL below.
FROM ubuntu:latest 
WORKDIR /pytorch

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get -y update
RUN apt install -y cmake \
                   wget \
                   make \
                   zip \
                   build-essential

RUN wget https://download.pytorch.org/libtorch/nightly/cpu/libtorch-shared-with-deps-latest.zip
RUN unzip libtorch-shared-with-deps-latest.zip -d /pytorch



WORKDIR /src 
COPY . .

RUN mkdir build 
WORKDIR /src/build


ENV Torch_DIR=/pytorch/libtorch/share/cmake/Torch
RUN cmake ..
RUN make 
