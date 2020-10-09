branch_name="";

__posh_git_ps1 () {
  repo_info="$(git rev-parse --is-inside-git-dir --is-inside-work-tree --short 2>/dev/null)";
  if [ -z "$repo_info" ]; then
    # 不是git
    return 1;
  fi
  icon=$(__branch_icon);
  branch_status=" ≢";

  info=(${repo_info//\n/ });
  inside_gitdir=${info[0]};
  if [ "true" = "$inside_gitdir" ]; then
    branch_name="GIT_DIR";
  else
    # inside_worktree=${info[1]};
    branch_name="$(git symbolic-ref --short HEAD 2>/dev/null)";
    branch_status=$(__branch_status);
  fi
  printf "$icon $branch_name$branch_status";
}

__branch_icon () {
  url="$(git ls-remote --get-url 2>/dev/null)";
  if [[ $url =~ \/\/github\. ]]; then
    printf ""; # fontawesome 0xF09B
  elif [[ $url =~ \/\/gitlab\. ]]; then
    printf ""; # fontawesome 0xF296
  else
    printf ""; # fontawesome 0xF126
  fi
}

__branch_status () {
  out="";
  origin_name="$(git status --short --branch 2>/dev/null | head -n 1)";
  if [[ $origin_name =~ \.\.\. ]]; then
    # 有远端分支
    origin_name=${origin_name##*...};
    origin_name=${origin_name%% *};
    count="$(git rev-list --left-right --count $origin_name...$branch_name 2>/dev/null)";
    arr=(${count// / });
    behind=${arr[0]};
    ahead=${arr[1]};
    if [ "$behind" -gt 0 ]; then
      out+=" ↓ $behind";
    fi
    if [ "$ahead" -gt 0 ]; then
      out+=" ↑ $ahead";
    fi
  fi
  if [ -z "$out" ]; then
    out=" ≡";
  fi
  printf "$out";
}
