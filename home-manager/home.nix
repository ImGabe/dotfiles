{ pkgs, ... }:

{
  imports = [
    ./modules/bash.nix
    ./modules/git.nix
    ./modules/redshift.nix
  ];

  home-manager.useUserPackages = true;
  home-manager.useGlobalPkgs = true;
  home-manager.users.gabe = {
    programs.home-manager.enable = true;
    programs = {
      fzf = {
        enable = true;
        enableBashIntegration = true;
      };

      direnv = {
        enable = true;

        nix-direnv = {
          enable = true;
          enableFlakes = true;
        };
      };

      vscode = {
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

      firefox = {
        profiles.gabe = {
          settings = {
            # https://wiki.archlinux.org/title/Firefox#Hardware_video_acceleration
            "gfx.webrender.all" = true;
            "browser.quitShortcut.disabled" = true;
            "media.ffmpeg.vaapi.enabled" = true;
            "media.ffvpx.enabled" = true;
            "media.navigator.mediadatadecoder_vpx_enabled" = true;
          };
        };

        extensions = with pkgs.nur.repos.rycee.firefox-addons; [
          https-everywhere
          privacy-badger
          decentraleyes
          link-cleaner
          octotree
          ublock-origin
          bitwarden
        ];
      };

    };

    home.file.".config/direnv/lib/use_flake.sh".text = ''
      use_flake() {
        watch_file flake.nix
        watch_file flake.lock
        eval "$(nix print-dev-env --profile "$(direnv_layout_dir)/flake-profile")"
      }
    '';

    home.username = "gabe";
    home.homeDirectory = "/home/gabe";
    home.packages = with pkgs; [
      mpv
      steam
      chromium
      discord
      spotify
      exercism
      tdesktop
      obsidian
      insomnia
      nixpkgs-fmt
    ];

    home.stateVersion = "21.05";
  };
}
