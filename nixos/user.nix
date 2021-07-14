{ config, lib, pkgs, ... }:

{
  users.users.gabe = {
    isNormalUser = true;
    uid = 1000;
    extraGroups = [ "wheel" "docker" ];
    password = "...";
  };
}
