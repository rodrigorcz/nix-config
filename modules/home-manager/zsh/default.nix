{config, ...}: {  
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = false;

    shellAliases = {
      ll = "ls -l";
      update-nix = "sudo nixos-rebuild switch --flake ~/nix-config/.#nixos";
      update-home = "home-manager switch --flake ~/nix-config/.#rodrigo";
      zshell = "nix-shell -p";
    };

    history = {
      size = 10000;
      save = 10000;
      path = "${config.xdg.dataHome}/zsh/history";
    };

    initExtra = ''
      autoload -U colors && colors
      setopt prompt_subst

      parse_git_branch() {
        git branch 2>/dev/null | grep '^*' | colrm 1 2
      }

      git_prompt_info() {
        local branch=$(parse_git_branch)
        if [ -n "$branch" ]; then
          echo " %{$fg_bold[yellow]%}($branch)%{$reset_color%}"
        fi
      }

      PROMPT='%{$fg_bold[green]%}%n@%m%{$reset_color%}:%{$fg_bold[cyan]%}%~%{$reset_color%}$(git_prompt_info) > '

      precmd() {
        precmd() {
          echo
        }
      }

    '';
  };
}