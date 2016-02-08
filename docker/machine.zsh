#!/bin/zsh

start-docker(){
  docker-machine start default
}
# start-docker &>/dev/null 2>&1

reload-docker() {
  eval "$(docker-machine env default)"
}
reload-docker &>/dev/null 2>&1
