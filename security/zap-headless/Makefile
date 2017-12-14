REPO=local
NAME=zap-headless
TAG=latest

.PHONY: build

build:
	docker build -t $(REPO)/$(NAME):$(TAG) .

run:
	docker run --name $(NAME) -p 127.0.0.1:80:80 -it --rm $(REPO)/$(NAME):$(TAG)

shell: build
	docker run -it --rm --entrypoint=bash $(REPO)/$(NAME):$(TAG)

exec-shell:
	docker exec -it $(NAME) bash

stop:
	docker stop $(NAME) || exit 0

rm: stop
	docker rm $(NAME)
