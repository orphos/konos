if [[ "$(locale LC_CTYPE)" == "UTF-8" ]]; then
  setopt COMBINING_CHARS
fi
disable log

autoload -Uz compinit && compinit

setopt auto_list
setopt auto_menu
setopt auto_cd
setopt auto_pushd
setopt pushd_ignore_dups

autoload -Uz colors
colors

# vim:set ts=2 sw=2 et:
