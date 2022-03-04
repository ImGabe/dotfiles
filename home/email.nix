{ config, ... }:

let
  inherit (config.meta) email name;
in
{
  programs.lieer.enable = true;
  programs.mbsync.enable = true;
  programs.msmtp.enable = true;
  programs.notmuch = {
    enable = true;
    hooks = {
      preNew = "mbsync --all";
    };
  };

  accounts.email = {
    accounts.gmail = {
      realName = name;
      address = email;
      userName = email;
      primary = true;

      imap.host = "imap.gmail.com";
      smtp.host = "smtp.gmail.com";

      passwordCommand = "rbw get mail.google.com";

      notmuch.enable = true;
      msmtp.enable = true;
      mbsync = {
        enable = true;
        create = "maildir";
      };

      signature = {
        text = ''
          ${name}
        '';
        showSignature = "append";
      };
    };
  };
}
