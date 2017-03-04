# http://blog.ysmood.org/my-ys-terminal-theme/
ZSH_THEME="ys"

plugins=(hub composer git sudo aws tmux tmuxinator rails ruby gem aws bower bundler brew-cask brew capistrano coffee docker emacs git-extras github heroku lein node npm nyan osx pip pod python redis-cli vagrant terraform scala sbt z docker-compose)

source $ZSH/oh-my-zsh.sh

export ZSH_TMUX_AUTOSTART=true
export ZSH_TMUX_AUTOCONNECT=true
