REPO=local
NAME=dependency-check
TAG=latest

.PHONY: build

build:
	docker build -t $(REPO)/$(NAME):$(TAG) .

run: build
	docker run --name $(NAME) -it --rm $(REPO)/$(NAME):$(TAG)

shell: build
	docker run -it --rm --entrypoint=bash $(REPO)/$(NAME):$(TAG)

exec-shell:
	docker exec -it $(NAME) bash

stop:
	docker stop $(NAME) || exit 0

rm: stop
	docker rm $(NAME)
