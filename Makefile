IMAGE_VER=latest
DOCKER_IMG=yikaus/alpine-bash:$(IMAGE_VER)
BASH=docker run -v "${PWD}:/dotfiles" $(DOCKER_IMG) bash
DOTFILES_INSTALL=/dotfiles/script/install
DOTFILES_CMD=$(BASH) $(DOTFILES_INSTALL)

test_ci: install

clean:
	rm -rf log/* || true

install:	docker-image clean
	$(DOTFILES_CMD)

docker-image:
	docker pull $(DOCKER_IMG)
	$(BASH) -version

.PHONY: test_ci clean install docker-image 
