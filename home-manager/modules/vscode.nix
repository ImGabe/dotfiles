{ pkgs, ... }:

{
  programs.vscode = {
    enable = true;

    userSettings = {
      "editor.rulers" = [ 80 120 ];
      "editor.minimap.enabled" = false;
      "window.menuBarVisibility" = "toggle";
      "window.titleBarStyle" = "custom";
      "workbench.colorTheme" = "GitHub Dark";
      "workbench.iconTheme" = "material-icon-theme";
      "eslint.format.enable" = true;
      "[javascript]" = {
        "editor.defaultFormatter" = "dbaeumer.vscode-eslint";
      };
    };

    extensions = with pkgs.vscode-extensions;
      [
        # Theme
        github.github-vscode-theme

        # Icons
        file-icons.file-icons

        # Git
        eamodio.gitlens

        # Docker
        ms-azuretools.vscode-docker

        # Nix
        jnoortheen.nix-ide

        # Javascript
        dbaeumer.vscode-eslint

        # Go
        golang.Go

        # Rust
        matklad.rust-analyzer

        # Markdown
        yzhang.markdown-all-in-one

      ];
  };
}
