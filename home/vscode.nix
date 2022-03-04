{ pkgs, ... }:

{
  programs.vscode = {
    enable = true;

    userSettings = {
      "editor.minimap.enabled" = false;

      # auto update tags when edited
      "editor.linkedEditing" = true;
      "editor.rulers" = [ 80 120 ];
      "editor.formatOnSave" = true;

      # font
      "editor.fontSize" = 14;
      "editor.fontLigatures" = true;
      "editor.fontFamily" = "Hasklug Nerd Font";

      # smooth
      "editor.cursorBlinking" = "phase";
      "editor.cursorSmoothCaretAnimation" = true;
      "editor.smoothScrolling" = true;

      # bracket
      "editor.bracketPairColorization.enabled" = true;
      "editor.guides.bracketPairs" = "active";

      # terminal font
      "terminal.integrated.fontFamily" = "hasklig";

      # tree indent
      "workbench.tree.indent" = 15;

      "window.menuBarVisibility" = "toggle";
      "window.titleBarStyle" = "custom";

      "workbench.colorTheme" = "Gruvbox Dark Medium";
      "workbench.iconTheme" = "file-icons";

      # Nix
      "nix.enableLanguageServer" = true;
      "[nix]" = {
        "editor.tabSize" = 2;
        "editor.insertSpaces" = true;
      };
    };

    extensions = with pkgs.vscode-extensions; [
      ## Themes
      # arcticicestudio.nord-visual-studio-code

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
      vadimcn.vscode-lldb # debug

      ## Markdown
      yzhang.markdown-all-in-one

      ## csharp
      ms-dotnettools.csharp

      ## rescript
      chenglou92.rescript-vscode

      ## copilot
      github.copilot

      ## tabnine
      tabnine.tabnine-vscode

      ## haskell
      haskell.haskell
      justusadam.language-haskell

      ## Misc
      eamodio.gitlens
      editorconfig.editorconfig
      esbenp.prettier-vscode
      usernamehw.errorlens
    ];
  };
}
