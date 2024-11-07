FROM rust:latest as builder
WORKDIR /usr/src/myapp
COPY . .
RUN cargo install --path .

FROM ubuntu:latest

COPY --from=builder /usr/local/cargo/bin/bingyan-freshman-task2-docker /usr/local/cargo/bin/bingyan-freshman-task2-docker

ENTRYPOINT ["bingyan-freshman-task2-docker"]
