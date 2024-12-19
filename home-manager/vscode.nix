{ pkgs, ... }:

{
  programs.vscode = {
    enable = true;

    userSettings = {
      "update.mode" = "none";
      "editor.minimap.enabled" = false;

      # auto update tags when edited
      "editor.linkedEditing" = true;
      "editor.rulers" = [ 80 120 ];
      "editor.formatOnSave" = true;

      # font
      "editor.fontSize" = 16;
      "editor.fontLigatures" = true;
      "editor.fontFamily" = "JetBrainsMono Nerd Font Mono";
      "terminal.integrated.fontFamily" = "JetBrains Mono";

      # smooth
      "editor.cursorBlinking" = "phase";
      "editor.cursorSmoothCaretAnimation" = "on";
      "editor.smoothScrolling" = true;

      # bracket
      "editor.bracketPairColorization.enabled" = true;
      "editor.guides.bracketPairs" = "active";

      # tree indent
      "workbench.tree.indent" = 15;

      "window.menuBarVisibility" = "toggle";
      "window.titleBarStyle" = "custom";

      "workbench.sideBar.location" = "right";

      "editor.semanticHighlighting.enabled" = true;
      "terminal.integrated.minimumContrastRatio" = 1;
    };

    extensions = with pkgs.vscode-extensions; [
      ## Git
      eamodio.gitlens

      ## Nix
      jnoortheen.nix-ide

      ## zig
      ziglang.vscode-zig

      ## Go
      golang.go

      ## Rust
      rust-lang.rust-analyzer
      tamasfe.even-better-toml

      ## Markdown
      yzhang.markdown-all-in-one

      ## Misc
      christian-kohler.path-intellisense
      mkhl.direnv
      editorconfig.editorconfig
      esbenp.prettier-vscode
      usernamehw.errorlens
    ];
  };
}
