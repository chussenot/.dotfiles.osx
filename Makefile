IMAGE_VER=latest
DOCKER_IMG=ubuntu:$(IMAGE_VER)
BASH=docker run -v "${PWD}:/root/dotfiles" $(DOCKER_IMG) bash
DOTFILES_INSTALL=/root/dotfiles/script/bootstrap
DOTFILES_CMD=$(BASH) $(DOTFILES_INSTALL)

help: ## Show this help.
	@fgrep -h "##" $(MAKEFILE_LIST) | fgrep -v fgrep | sed -e 's/\\$$//' | sed -e 's/##//'

test_ci: install

clean: ## Clean the log folder
	rm -rf log/* || true

install:	docker-image clean
	$(DOTFILES_CMD)

docker-image:
	docker pull $(DOCKER_IMG)
	$(BASH) -version

bootstrap: ## Bootstrap your dotfiles configuration
	script/bootstrap

update: ## Update your dependencies
	script/update

.PHONY: test_ci clean install docker-image bootstrap update
