CONTAINER_NAME=acestream
IMAGE=cturra/$(CONTAINER_NAME)
# ---------

.PHONY: build logs run shell start stats stop


build:
	docker build --pull --tag $(IMAGE) .


logs:
	docker logs --follow $(CONTAINER_NAME)


run:
	docker run --rm                     \
                   --name=$(CONTAINER_NAME) \
                   --detach=true            \
                   --publish=6878:6878      \
                   $(IMAGE):latest
	@echo " Stream => http://<DOCKER_HOST>:6878/ace/getstream?id=<CONTENT_ID>"


shell:
	docker exec -ti $(CONTAINER_NAME) /bin/bash


start:	run


stats:
	docker stats $(CONTAINER_NAME)


stop:
	docker rm --force $(CONTAINER_NAME)
