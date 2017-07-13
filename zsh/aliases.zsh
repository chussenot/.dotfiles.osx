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
