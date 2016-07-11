#!/usr/bin/env make

#GOROOT=/usr/local/go
#GOROOT=/usr/local/go1.6
#GOROOT=/usr/local/go1.5.3

ebucket=github.com/bioothod/ebucket-go/ebucket

BUILD_DATE=$(shell date "+%Y-%m-%d/%H:%M:%S/%z")

GO_LDFLAGS=-ldflags "-X ${ebucket}.BuildDate=${BUILD_DATE} \
	-X ${ebucket}.LastCommit=$(shell git rev-parse --short HEAD) \
	-X ${ebucket}.EllipticsGoLastCommit=$(shell GIT_DIR=${GOPATH}/src/github.com/bioothod/elliptics-go/.git git rev-parse --short HEAD)"

.DEFAULT: install
.PHONY: install

all: install

install:
	CGO_CXXFLAGS=-I${GOPATH}/src/github.com/bioothod/elliptics-go/elliptics go install
