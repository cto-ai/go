############################
# Build container
############################
FROM node:10-alpine AS build

WORKDIR /ops

RUN apk add --no-cache python make

ADD package.json .
RUN npm install

ADD . .

############################
# Final container
############################
FROM registry.cto.ai/official_images/node:latest

RUN apt update && apt install -y -q git

RUN wget --quiet https://dl.google.com/go/go1.13.3.linux-amd64.tar.gz \
  && tar -xf go1.13.3.linux-amd64.tar.gz

# Configure Go
ENV GOPATH /usr/local/go
ENV GOROOT /go
ENV PATH /go/bin:/usr/local/go/bin:$PATH

RUN mkdir -p ${GOPATH} ${GOPATH}/src ${GOPATH}/bin /usr/local/go

#COPY --from=build /usr/bin/git /usr/bin/git
COPY --from=build /ops /ops

WORKDIR /ops
