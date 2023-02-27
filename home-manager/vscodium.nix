{ pkgs, ... }:

{
  programs.vscode = {
    enable = true;
    package = pkgs.vscodium;

    userSettings = {
      "editor.minimap.enabled" = false;

      # auto update tags when edited
      "editor.linkedEditing" = true;
      "editor.rulers" = [ 80 120 ];
      "editor.formatOnSave" = true;

      # font
      "editor.fontSize" = 14;
      "editor.fontLigatures" = true;
      "editor.fontFamily" = "JetBrains Mono";
      "terminal.integrated.fontFamily" = "JetBrains Mono";

      # smooth
      "editor.cursorBlinking" = "phase";
      "editor.cursorSmoothCaretAnimation" = true;
      "editor.smoothScrolling" = true;

      # bracket
      "editor.bracketPairColorization.enabled" = true;
      "editor.guides.bracketPairs" = "active";

      # tree indent
      "workbench.tree.indent" = 15;

      "window.menuBarVisibility" = "toggle";
      "window.titleBarStyle" = "custom";

      "workbench.colorTheme" = "Gruvbox Dark Medium";
      "workbench.iconTheme" = "file-icons";
    };

    extensions = with pkgs.vscode-extensions; [
      ## Themes
      jdinhlife.gruvbox

      ## Icons
      file-icons.file-icons

      ## Git
      eamodio.gitlens

      ## Nix
      jnoortheen.nix-ide

      ## Go
      golang.go

      ## Rust
      matklad.rust-analyzer

      ## Markdown
      yzhang.markdown-all-in-one

      ## Misc
      editorconfig.editorconfig
      esbenp.prettier-vscode
      usernamehw.errorlens
    ];
  };
}
