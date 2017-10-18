#!/bin/sh
brew() {
  case "$1" in
    cleanup)
      command brew cleanup
      command brew cask cleanup
      command brew prune
      ;;
    bump)
      command brew update
      command brew upgrade
      brew cleanup
      brew cu # https://github.com/buo/homebrew-cask-upgrade
      ;;
    *)
      command brew "$@"
      ;;
  esac
}
