FROM rust:latest AS builder
WORKDIR /usr/src/myapp
COPY . .
RUN cargo install --path .

FROM ubuntu:latest

COPY --from=builder /usr/local/cargo/bin/bingyan-freshman-task2-docker /usr/local/bin/bingyan-freshman-task2-docker

ENTRYPOINT ["bingyan-freshman-task2-docker"]
