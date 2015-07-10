#!/bin/bash
alias rmpyc='find . -name "*.pyc" -exec rm -rf {} \;'

# Useful aliases
alias ls='ls $LS_OPTIONS -hF --color'
alias ll='ls $LS_OPTIONS -l'
alias l='ls $LS_OPTIONS -lA'
alias cd..="cd .."
alias c="clear"
alias e="exit"
alias ssh="ssh -X"
alias ..="cd .."

alias dope='python ~/dope/dope.py'
alias pygrep='grep --include="*.py" -R'
