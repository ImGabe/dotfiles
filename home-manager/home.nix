{ pkgs, ... }:

{
  imports = [
    ./modules/redshift.nix
  ];

  home-manager.useUserPackages = true;
  home-manager.useGlobalPkgs = true;
  home-manager.users.gabe = {
    programs.home-manager.enable = true;

    programs = {
      git = {
        enable = true;
        userName = "ImGabe";
        userEmail = "gabrielpmonte@hotmail.com";
      };

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

      bash = {
        enable = true;
        historySize = 10000;
        shellOptions = [
          # Append to history file rather than replacing it.
          "histappend"

          # check the window size after each command and, if
          # necessary, update the values of LINES and COLUMNS.
          "checkwinsize"

          # Extended globbing.
          "extglob"
          "globstar"

          # Warn if closing shell with running jobs.
          "checkjobs"
        ];

        historyControl = [
          "erasedups"
          "ignoredups"
          "ignorespace"
        ];

        shellAliases = {
          ls = "ls --color=auto";
          ll = "ls -l";
          la = "ls -A";
          lt = "ls --human-readable --size -1 -S --classify";
          l = "ls -CF";
          grep = "grep --color=auto";
          ".." = "cd ..";
        };

        bashrcExtra = builtins.readFile ./config/.bashrc;
      };

      firefox = {
        enable = true;

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

            # Nix
            jnoortheen.nix-ide

            # Go
            golang.Go

            # Rust
            matklad.rust-analyzer

            # Markdown
            yzhang.markdown-all-in-one

          ]
          ++ pkgs.vscode-utils.extensionsFromVscodeMarketplace [
            {
              name = "vscode-eslint";
              publisher = "dbaeumer";
              version = "2.1.20";
              sha256 = "0xk8pxv5jy89fshda845iswryvmgv0yxr11xsdbvd9zdczqhg7wc";
            }
          ];
      };
    };

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

    home.file.".config/direnv/lib/use_flake.sh".text = ''
      use_flake() {
        watch_file flake.nix
        watch_file flake.lock
        eval "$(nix print-dev-env --profile "$(direnv_layout_dir)/flake-profile")"
      }
    '';

    home.stateVersion = "21.05";
  };
}
