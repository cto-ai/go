############################
# Final container
############################
FROM registry.cto.ai/official_images/bash:2-buster-slim

WORKDIR /ops

RUN apt-get install sudo -y
RUN useradd --groups sudo go
RUN echo "go ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers

USER go

ADD . .
