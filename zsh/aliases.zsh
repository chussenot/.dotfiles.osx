#!/bin/sh

## reload all
alias reload!='exec "$SHELL" -l'

## create parent directories on demand
alias mkdir='mkdir -pv'

## get top process eating memory
alias psmem='ps auxf | sort -nr -k 4'
alias psmem10='ps auxf | sort -nr -k 4 | head -10'

# clear your terminal
alias c='clear'

## make you look all busy and fancy in the eyes of non-technical people.
alias busy="cat /dev/urandom | hexdump -C | grep "ca fe""

# enable aliases to be sudo’ed
alias sudo='sudo '

# Colorize
# `grc` works great for this. It is installable with brew and colorizes a number
# of terminal commands out of the box, diff being one of them. So...
export GRC=/usr/local/bin/grc
alias colourify="$GRC -es --colour=auto"
alias configure='colourify ./configure'
alias diff='colourify diff'
alias make='colourify make'
alias gcc='colourify gcc'
alias g++='colourify g++'
alias as='colourify as'
alias gas='colourify gas'
alias ld='colourify ld'
alias netstat='colourify netstat'
alias ping='colourify ping'
alias traceroute='colourify /usr/sbin/traceroute'
alias head='colourify head'
alias tail='colourify tail'
alias dig='colourify dig'
alias mount='colourify mount'
alias ps='colourify ps'
alias mtr='colourify mtr'
alias df='colourify df'
