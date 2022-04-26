# Tell docker the base image of my container.
FROM golang:1.16-alpine

ADD https://github.com/golang/dep/releases/download/v0.4.1/dep-linux-amd64 /usr/bin/dep
RUN chmod +x /usr/bin/dep

ENV GO111MODULE=on

# This is the working directory of my app, I won't need to type out the full path and things will be relative to this.

#RUN mkdir $GOPATH/src/mitchelllawson/dmapreduce

WORKDIR $GOPATH/src/mitchelllawson/dmapreduce

#WORKDIR /Users/mitchelllawson/GolandProjects/DistributedMapReduce
#WORKDIR milawson/DistributedMapReduce/

COPY go.mod ./
COPY go.sum ./
RUN go mod download
#RUN go mod download golang.org/x/sys

#RUN dep ensure --vendor-only

COPY *.go ./

# COPY . ./

EXPOSE 8080

CMD ["go","run","main.go"]