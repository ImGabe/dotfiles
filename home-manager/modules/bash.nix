{ pkgs, ... }:

{
  programs.bash = {
    enable = true;

    shellAliases = {
      ls = "ls --color=auto";
      ll = "ls -l";
      la = "ls -A";
      lt = "ls --human-readable --size -1 -S --classify";
      l = "ls -CF";
      grep = "grep --color=auto";
      ".." = "cd ..";
    };
  };
}
