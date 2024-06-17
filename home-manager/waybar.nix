{ pkgs, ... }:

{
  programs.waybar = {
    enable = true;
    settings = {
      main = {
        layer = "top";
        position = "top";
        height = 25;
        modules-left = [
          "group/group-power"
          "sway/workspaces"
          "sway/mode"
        ];
        modules-center = [ "clock" ];

        modules-right = [
          "custom/spotify"
          "custom/pipewire"
          "disk"
          "privacy"
          "tray"
        ];

        "custom/spotify" = {
          format = "{icon} {}  ";
          format-icons = {
            Playing = "  ";
            Paused = "  ";
          };

          max-length = 40;
          return-type = "json";

          on-click = "${pkgs.playerctl} -p spotify play-pause";
          on-click-right = "${pkgs.killall} spotify";

          on-scroll-up = "${pkgs.playerctl}  -p spotify next";
          on-scroll-down = "${pkgs.playerctl}  -p spotify previous";

          exec = "${pkgs.playerctl}  -p spotify -a metadata --format '{\"text\": \"{{artist}} - {{markup_escape(title)}}\", \"tooltip\": \"{{playerName}} : {{markup_escape(title)}}\", \"alt\": \"{{status}}\", \"class\": \"{{status}}\"}' -F";
          exec-if = "pgrep spotify";
        };

        "custom/pipewire" = {
          format = "{icon}    {percentage}";
          return-type = "json";

          interval = "once";
          signal = 8;

          on-scroll-up = "${pkgs.pw-volume} change +5%; pkill -RTMIN+8 waybar";
          on-scroll-down = "${pkgs.pw-volume} change -5%; pkill -RTMIN+8 waybar";
          on-click-right = "${pkgs.pw-volume} mute toggle; pkill -RTMIN+8 waybar";

          format-icons = {
            mute = "";
            default = [ "" "" "" ];
          };

          exec = "${pkgs.pw-volume} status";
        };

        "tray" = {
          icon-size = 21;
          spacing = 5;
        };

        "privacy" = {
          icon-spacing = 4;
          icon-size = 18;
          transition-duration = 250;
          modules = [
            {
              type = "screenshare";
              tooltip = true;
              tooltip-icon-size = 21;
            }
            {
              type = "audio-out";
              tooltip = true;
              tooltip-icon-size = 21;
            }
            {
              type = "audio-in";
              tooltip = true;
              tooltip-icon-size = 21;
            }
          ];
        };

        "cpu" = {
          interval = 10;
          format = "    {}%";
        };

        "memory" = {
          interval = 30;
          format = "    {}%";
        };

        "disk" = {
          interval = 30;
          format = "   {free}";
        };

        "temperature" = {
          format = "  {temperatureC}°C";
        };

        "clock" = {
          format = "{:%R}";
          format-alt = "{:%B %d, %R}";
        };

        "custom/lock" = {
          format = " 󰍁 ";
          on-click = "swaylock";
          tooltip = false;
        };

        "custom/power" = {
          format = "  ";
          on-click = "shutdown now";
          tooltip = false;
        };

        "custom/quit" = {
          format = " 󰗼 ";
          on-click = "hyprctl dispatch exit"; # FIX
          tooltip = false;
        };

        "custom/reboot" = {
          format = " 󰜉 ";
          on-click = "reboot";
          tooltip = false;
        };

        "group/group-power" = {
          drawer = {
            children-class = "not-lock";
            transition-duration = 500;
            transition-left-to-right = true;
          };
          modules = [
            "custom/lock"
            "custom/quit"
            "custom/reboot"
            "custom/power"
          ];
          orientation = "inherit";
        };
      };
    };

    style = ''
      * {
        /* `otf-font-awesome` is required to be installed for icons */
        font-family: FontAwesome, Roboto, Helvetica, Arial, sans-serif;
        font-size: 12px;
      }

      window#waybar {
        background-color: rgba(43, 48, 59, 0.2);
        
        border-bottom: 3px solid rgba(100, 114, 125, 0);
        color: #ffffff;
        transition-property: background-color;
        transition-duration: .5s;
      }

      button {
        /* Use box-shadow instead of border so the text isn't offset */
        box-shadow: inset 0 -3px transparent;
        /* Avoid rounded borders under each button name */
        border: none;
        border-radius: 0;
      }

      /* https://github.com/Alexays/Waybar/wiki/FAQ#the-workspace-buttons-have-a-strange-hover-effect */
      button:hover {
        background: inherit;
      }

      /* you can set a style on hover for any module like this */
      #pulseaudio:hover {
        background-color: #a37800;
      }

      #workspaces button {
        padding: 0 5px;
        color: #ffffff;
      }

      #workspaces button:hover {
        background: rgba(0, 0, 0, 0.5);
      }

      #workspaces button.focused {
        background: rgba(0, 0, 0, 0.5);
      }

      #workspaces button.urgent {
        background-color: #eb4d4b;
      }

      #mode {
        background-color: #64727D;
      }

      #clock,
      #battery,
      #cpu,
      #memory,
      #disk,
      #temperature,
      #pulseaudio,
      #wireplumber,
      #tray,
      #mode
      {
        border-radius: 25px;
        padding: 0 8px;
        color: #ffffff;
      }

      #window,
      #workspaces {
        margin: 0 4px;
      }

      /* If workspaces is the leftmost module, omit left margin */
      .modules-left>widget:first-child>#workspaces {
        margin-left: 0;
      }

      /* If workspaces is the rightmost module, omit right margin */
      .modules-right>widget:last-child>#workspaces {
        margin-right: 0;
      }

      @keyframes blink {
        to {
          background-color: #ffffff;
          color: #000000;
        }
      }

      label:focus {
        background-color: #000000;
      }

      #wireplumber {
        background-color: #fff0f5;
        color: #000000;
      }

      #wireplumber.muted {
        background-color: #f53c3c;
      }

      #custom-media {
        background-color: #66cc99;
        color: #2a5c45;
        min-width: 100px;
      }

      #custom-media.custom-spotify {
        background-color: #66cc99;
      }

      #temperature.critical {
        background-color: #eb4d4b;
      }

      #tray>.passive {
        -gtk-icon-effect: dim;
      }

      #tray>.needs-attention {
        -gtk-icon-effect: highlight;
        background-color: #eb4d4b;
      }
    '';
  };
}
