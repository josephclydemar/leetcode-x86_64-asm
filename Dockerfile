FROM ubuntu:latest

RUN apt update && \
  apt install -y nasm build-essential && \
  apt clean && rm -rf /var/lib/apt/lists/*

WORKDIR /app
COPY . /app

RUN make

CMD [ "make", "test-verbose" ]
