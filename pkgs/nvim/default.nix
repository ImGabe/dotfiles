{ pkgs, ... }:

{
  programs.neovim = {
    enable = true;

    viAlias = true;
    vimAlias = true;

    plugins = with pkgs.vimPlugins; [
      #theme
      nord-vim

      # nerdtree
      nerdtree
      nerdtree-git-plugin

      # nix language
      vim-nix
    ];

    extraConfig = ''
      colorscheme nord
    '';
  };
}
