REGISTRY = ghcr.io
IMAGE_NAME = makes-ms/test-cicd-web
VERSION ?= latest
OS = linux
ARCH = amd64

build:
	docker build --platform $(OS)/$(ARCH) -t $(REGISTRY)/$(IMAGE_NAME):$(VERSION)-$(OS)-$(ARCH) .

push:
	docker push $(REGISTRY)/$(IMAGE_NAME):$(VERSION)-$(OS)-$(ARCH)

test:
	docker compose up -d
	sleep 3
	curl --fail http://localhost:8080 || exit 1
	docker compose down