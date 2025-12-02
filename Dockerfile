FROM ubuntu:22.04 AS build

RUN apt update && \
  apt install -y build-essential && \
  apt clean && rm -rf /var/lib/apt/lists/*

WORKDIR /app

COPY . /app

RUN make

FROM ubuntu:22.04

WORKDIR /app

COPY --from=build /app /app

CMD [ "/app/build/test.out", "--verbose=0" ]
