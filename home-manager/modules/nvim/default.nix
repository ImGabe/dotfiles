{ pkgs, ... }:

{
  programs.neovim = {
    enable = true;
    viAlias = true;

    plugins = with pkgs.vimPlugins; [
      #theme
      nord-vim

      # nerdtree
      nerdtree
      nerdtree-git-plugin

      # vim-airline
      vim-airline
      vim-airline-themes

      # idk
      vim-autoformat
      auto-pairs
      YouCompleteMe
      vim-gitgutter
      auto-pairs

      # nix language
      vim-nix
    ];

    extraConfig = ''
      colorscheme nord
    '';
  };
}
