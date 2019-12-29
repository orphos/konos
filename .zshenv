env_dir="$HOME/.config/zsh/env/conf.d"
if test -d "$env_dir"; then
  for env_file in "$env_dir"/*.zsh(on); do
    . "$env_file"
  done
fi

# vim: set ts=2 sw=2 ft=zsh et:
