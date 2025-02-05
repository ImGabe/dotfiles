{ pkgs, ... }:

{
  programs.git = {
    enable = true;
    package = pkgs.git;

    userName = "Gabriel Pereira Monte";
    userEmail = "gabrielpmonte@hotmail.com";

    aliases = {
      st = "status"; # Alias para git status
      co = "checkout"; # Alias para git checkout
      br = "branch"; # Alias para git branch
      ci = "commit"; # Alias para git commit
      df = "diff"; # Alias para git diff
      lg = "log --oneline --graph --decorate --all"; # Alias para um log mais detalhado
    };

    extraConfig = {
      init.defaultBranch = "main"; # Define a branch padrão como 'main'
      color.ui = "auto"; # Ativa a coloração da interface do Git
      pull.rebase = "true"; # Usa rebase ao invés de merge no pull
      credential.helper = "cache"; # Cache de credenciais

      core = {
        editor = "code --wait"; # Define o editor padrão (VS Code)
        fileMode = "false"; # Ignora permissões de arquivos nas mudanças
        autocrlf = "input"; # Manuseio de fim de linha adequado para Unix
        excludesFile = "/home/usuario/.gitignore_global"; # Arquivo global de exclusões
      };
    };
  };

  programs.lazygit.enable = true;
}
