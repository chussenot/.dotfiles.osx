#!/bin/sh
__reload_dotfiles() {
  PATH="$(command -p getconf PATH):/usr/local/bin"
  . ~/.zshrc
  cd .
}
alias reload!='__reload_dotfiles'

## create parent directories on demand
alias mkdir='mkdir -pv'

## get top process eating memory
alias psmem='ps auxf | sort -nr -k 4'
alias psmem10='ps auxf | sort -nr -k 4 | head -10'

alias c='clear'

## make you look all busy and fancy in the eyes of non-technical people.
alias busy="cat /dev/urandom | hexdump -C | grep "ca fe""

## nethack game
alias nethack='telnet -e ^c nethack.alt.org'
