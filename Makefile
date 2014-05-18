
CONTAINER_NAME = flask-app
PUBLISH_PORT = 80:80
DOCKER_ERROR := $(shell docker info 2>&1 | grep -i 'cannot connect')
OS := $(shell uname)


all: setup clean build run
		@echo "done"


.PHONY: setup
setup:
ifneq ($(DOCKER_ERROR),)
ifeq ($(OS),Darwin)
		@echo "make boot2docker-cli"
		@./scripts/make-boot2docker-cli.sh
		@./boot2docker start
		@./scripts/fix-boot2docker-dns.sh
		@echo "boot2docker-cli setup done"
else
		@echo $(DOCKER_ERROR)
endif
else
		@echo "docker is running"
endif


.PHONY: clean
clean:
		@if [[ -f .container-id ]]; \
		then \
			echo "stopping docker container"; \
			cat .container-id | xargs docker stop; \
			rm .container-id; \
		fi;
		@docker ps -a -q | xargs docker rm
		@echo "removing old docker images"
		@docker images --no-trunc | grep 'none' | awk '{print $3}' | xargs docker rmi


.PHONY: build
build: clean
		@echo "building docker container"
		@docker build -t $(CONTAINER_NAME) .


.PHONY: run
run: build
		@echo "starting docker container"
		@CONTAINER_ID="$(shell docker run -p $(PUBLISH_PORT) -d $(CONTAINER_NAME))"; \
		echo $$CONTAINER_ID >> .container-id;


.PHONY: test
test:
		@if [ -a boot2docker ]; \
		then \
			./scripts/get-boot2docker-ip.sh curl; \
		else \
			curl localhost:80; \
		fi;
