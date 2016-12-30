SERVICE_NAME ?= collectd
DOCKER_TAG ?= latest
VERSION ?= 1.0

image:
	docker build --pull -t yinc2/$(SERVICE_NAME):$(DOCKER_TAG) -f Dockerfile .

push:
	docker push yinc2/$(SERVICE_NAME):$(DOCKER_TAG)
	docker tag yinc2/$(SERVICE_NAME):$(DOCKER_TAG) yinc2/$(SERVICE_NAME):$(VERSION)
	docker push yinc2/$(SERVICE_NAME):$(VERSION)
