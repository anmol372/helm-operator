# Build-time variables to inject into binaries
export GIT_VERSION = $(shell git describe --tags --always --dirty)
export GIT_COMMIT = $(shell git rev-parse HEAD)

# Build settings
SHELL=/bin/bash
REPO = $(shell go list -m)
BUILD_DIR = $(PWD)/bin
GO_BUILD_ARGS = \
  -gcflags "all=-trimpath=$(shell dirname $(shell pwd))" \
  -asmflags "all=-trimpath=$(shell dirname $(shell pwd))" \
  -ldflags " \
    -s \
    -w \
    -X '$(REPO)/internal/version.GitVersion=$(GIT_VERSION)' \
    -X '$(REPO)/internal/version.GitCommit=$(GIT_COMMIT)' \
  " \

export GO111MODULE = on
export CGO_ENABLED = 0
export PATH := $(BUILD_DIR):$(PWD)/tools/bin:$(PATH)

.PHONY: all
all: manager

# Run tests
.PHONY: test
export KUBEBUILDER_ASSETS := $(PWD)/tools/bin
test:
	./tools/scripts/fetch envtest 0.6.3
	go test -race -covermode atomic -coverprofile cover.out ./...

# Build manager binary
.PHONY: build
build:
	mkdir -p $(BUILD_DIR) && go build $(GO_BUILD_ARGS) -o $(BUILD_DIR) ./main.go

# Run go fmt against code
.PHONY: fix
fix:
	go mod tidy
	go fmt ./...

# Run go vet against code
.PHONY: check
check: fix
	go vet ./...
	./tools/scripts/fetch golangci-lint 1.31.0 && ./tools/bin/golangci-lint run
	git diff --exit-code

# Build the docker image
.PHONY: docker-build
IMG = quay.io/joelanford/helm-operator
docker-build:
	docker build . -t ${IMG}

# Push the docker image
.PHONY: docker-push
docker-push:
	docker push ${IMG}

.PHONY: clean
clean:
	rm -rf ./tools/bin $(BUILD_DIR) dist
