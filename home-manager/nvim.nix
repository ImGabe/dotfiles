{ ... }:

{
  programs.neovim = {
    enable = true;

    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;

    extraConfig = ''
      " show numbers
      set number

      " show relative numbers
      set relativenumber

      " show column ruler
      set colorcolumn=80

      " using system clipboard
      set clipboard=unnamedplus
    '';
  };
}
