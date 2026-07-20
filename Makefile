# Makefile for Forensic Tool
IMAGE_NAME=kubescope
REGISTRY=ghcr.io
USERNAME=schz404
TAG=latest
FULL_IMAGE=$(REGISTRY)/$(USERNAME)/$(IMAGE_NAME):$(TAG)

# Build the image locally
build:
	docker build -t $(FULL_IMAGE) ./kubescope

# Push to GitHub Container Registry (requires 'docker login')
push:
	docker push $(FULL_IMAGE)

# Combined command to build and push
all: build push

# Clean up local image to save space
clean:
	docker rmi $(FULL_IMAGE)
