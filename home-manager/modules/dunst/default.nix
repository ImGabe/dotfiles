{ pkgs, ... }:

{
  services.dunst = {
    enable = true;

    settings = {
      global = {
        ### Display ###

        # Which monitor should the notifications be displayed on.
        monitor = 0;

        # Display notification on focused monitor.  
        follow = "keyboard";

        # Screen width minus the width defined in within the geometry option.
        geometry = "300x5-30+20";

        # Show how many messages are currently hidden (because of geometry).
        indicate_hidden = true;

        # Shrink window if it's smaller than the width.
        shrink = true;

        # Window Transparency.
        transparency = 0;

        # The height of the entire notification.
        notification_height = 0;

        # Height of separator between notifications.
        separator_height = 1;

        # Padding between text and separator.
        padding = 8;

        # Horizontal padding.
        horizontal_padding = 10;

        # Border width (set to 0 to disable). 
        frame_width = 3;

        # Border color. 
        frame_color = "#4c566a";

        # Define a color for the separator.
        separator_color = "frame";

        # Sort messages by urgency.
        sort = true;


        ### Text ###
        font = "Monospace 10";

        # The spacing between lines.
        line_height = 0;

        # It's important to note that markup inside the format option will be parsed
        # regardless of what this is set to.
        markup = "center";

        # The format of the message.
        format = "<b>%s</b>\n%b";

        # Alignment of message text.
        alignment = "left";

        # Vertical alignment of message text and icon.
        vertical_alignment = "center";

        # Show age of message if message is older than show_age_threshold seconds.
        show_age_threshold = 60;

        # Split notifications into multiple lines if they don't fit into geometry.
        word_wrap = true;

        # When word_wrap is set to no, specify where to make an ellipsis in long lines.
        ellipsize = "middle";

        # Ignore newlines '\n' in notifications.
        ignore_newline = false;

        # Stack together notifications with the same content
        stack_duplicates = true;

        # Hide the count of stacked notifications with the same content
        hide_duplicate_count = false;

        # Display indicators for URLs (U) and actions (A).
        show_indicators = true;

        ### Icons ###

        # Align icons left/right/off
        icon_position = "left";

        # Scale small icons up to this size, set to 0 to disable.
        min_icon_size = 0;

        # Scale larger icons down to this size, set to 0 to disable
        max_icon_size = 256;


        ### History ###

        # Should a notification popped up from history be sticky or timeout
        # as if it would normally do.
        sticky_history = true;

        # Maximum amount of notifications kept in history
        history_length = 20;

        ### Misc/Advanced ###

        # Browser for opening urls in context menu.
        browser = "${pkgs.firefox} --new-tab";

        # Always run rule-defined scripts, even if the notification is suppressed
        always_run_script = true;

        # Define the title of the windows spawned by dunst
        title = "Dunst";

        # Define the class of the windows spawned by dunst
        class = "Dunst";

        # Print a notification on startup.
        # This is mainly for error detection, since dbus (re-)starts dunst
        # automatically after a crash.
        startup_notification = false;

        # Manage dunst's desire for talking.
        verbosity = "mesg";

        # Define the corner radius of the notification window.
        corner_radius = 0;

        # Ignore the dbus closeNotification message.
        ignore_dbusclose = false;
      };

      shortcuts = {
        close = "ctrl+space";
        close_all = "ctrl+shift+space";
      };

      urgency_low = {
        background = "#2e3440"; # #3b4252
        foreground = "#81a1c1";
        timeout = 5;
      };

      urgency_normal = {
        background = "#2e3440";
        foreground = "#5e81ac";
        timeout = 10;
      };

      urgency_critical = {
        background = "#2e3440";
        foreground = "#bf616a";
        timeout = 0;
      };
    };
  };

  home.packages = with pkgs; [ libnotify ];
}
