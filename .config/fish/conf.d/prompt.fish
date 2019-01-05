function _repo_prompt
  set -l pwd (pwd)
  set -l target (realpath $argv[1])
  set -l next (realpath $target/..)
  cd $target
  set -l git_branch (git branch ^/dev/null | sed -n '/\* /s///p')
  set -l normal_color     (set_color normal)
  set -l success_color    (set_color $fish_pager_color_progress ^/dev/null; or set_color cyan)
  set -l error_color      (set_color $fish_color_error ^/dev/null; or set_color red --bold)
  set -l directory_color  (set_color $fish_color_quote ^/dev/null; or set_color brown)
  set -l repository_color (set_color $fish_color_cwd ^/dev/null; or set_color green)
  if test -d .git; or command git rev-parse --git-dir >/dev/null ^/dev/null
    echo
    echo -n '<'
    echo -n $repository_color$git_branch$normal_color
    echo -n '>'
    if test -n (echo (command git status --porcelain))
      echo -n $repository_color' *'$normal_color
    end
  else
    if test $target = $next; or command test $target = "/"
      return
    else
      _repo_prompt $next
    end
  end
  cd $pwd
end

function fish_prompt
  set -l last_command_status $status
  #set -l cwd (prompt_pwd)
  set -l cwd (pwd)
  set -l date (date +'%y%m%d_%H%M')
  set -l git_branch (git branch ^/dev/null | sed -n '/\* /s///p')
  set -l normal_color     (set_color normal)
  set -l success_color    (set_color $fish_pager_color_progress ^/dev/null; or set_color cyan)
  set -l error_color      (set_color $fish_color_error ^/dev/null; or set_color red --bold)
  set -l directory_color  (set_color $fish_color_quote ^/dev/null; or set_color brown)
  set -l repository_color (set_color $fish_color_cwd ^/dev/null; or set_color green)
  echo -n '['$date']'
  echo
  echo -n (whoami)
  echo -n '@'
  echo -n (hostname)
  echo -n ':'
  echo -n -s $directory_color $cwd $normal_color
  _repo_prompt (pwd)
  #if test -d .git; or command git rev-parse --git-dir >/dev/null ^/dev/null
  #  echo -n ' <'
  #  echo -n $repository_color$git_branch$normal_color
  #  echo -n '>'
  #  if test -n (echo (command git status --porcelain))
  #    echo -n $repository_color' *'$normal_color
  #  end
  #end
  echo -n ' '
  if test $last_command_status -ne 0
    echo -n -s $error_color $last_command_status $normal_color
  end
  echo
  echo -n '$ '
end

