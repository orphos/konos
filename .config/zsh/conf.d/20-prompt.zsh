setopt prompt_subst

_git_prompt() {
  if test -d .git || git rev-parse --git-dir 1>/dev/null 2>/dev/null; then
    echo ''
    echo -n '<%F{002}'
    echo -n "$(git branch 2>/dev/null | sed -n '/\* /s///p')"
    echo -n '%f>'
    if test -n "$(git status --porcelain)"; then
      echo -n '%F{002}*%f'
    fi
  fi
}
PROMPT="[\$(date '+%y%m%d_%H%M')]
%n@%M:%F{178}%~%f \$(_git_prompt)%(?.. %F{196}%?%f)
$ "
