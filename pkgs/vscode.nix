{ pkgs, ... }:

{
  programs.vscode = {
    enable = true;

    userSettings = {
      "editor.fontFamily" = "Hasklug Nerd Font";
      "editor.fontLigatures" = true;
      "editor.fontSize" = 14;

      "editor.rulers" = [ 80 120 ];
      "editor.minimap.enabled" = false;

      "terminal.integrated.fontFamily" = "hasklig";

      "window.menuBarVisibility" = "toggle";
      "window.titleBarStyle" = "custom";

      "workbench.colorTheme" = "Nord";
      "workbench.iconTheme" = "file-icons";

      "[javascript]" = {
        "editor.defaultFormatter" = "dbaeumer.vscode-eslint";
        "eslint.format.enable" = true;
      };
    };

    extensions = with pkgs.vscode-extensions;
      [
        ## Themes
        github.github-vscode-theme
        arcticicestudio.nord-visual-studio-code

        ## Icons
        file-icons.file-icons

        ## Git
        eamodio.gitlens

        ## Docker
        ms-azuretools.vscode-docker

        ## Nix
        jnoortheen.nix-ide

        ## Javascript
        dbaeumer.vscode-eslint

        ## Go
        golang.go

        ## Rust
        matklad.rust-analyzer

        ## Markdown
        yzhang.markdown-all-in-one

      ];
  };
}
