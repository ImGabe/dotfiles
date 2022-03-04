{ lib, pkgs, ... }:

with pkgs.lib;

{
  options.meta = {
    username = mkOption {
      type = types.str;
      default = "gabe";
      description = "The default username";
    };

    email = mkOption {
      type = types.str;
      default = "gabrielpmonte@gmail.com";
      description = "The default email";
    };

    name = mkOption {
      type = types.str;
      default = "Gabriel Pereira";
      description = "The default name";
    };
  };
}
