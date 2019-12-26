config_dir="$HOME/.config/zsh/conf.d"
if test -d "$config_dir"; then
  for config in "$config_dir"/*.zsh(on); do
    . "$config"
  done
fi

# vim: set ts=2 sw=2 ft=zsh et:
