{ pkgs, ... }:

{
  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;

    withNodeJs = true;
    withPython3 = true;
    withRuby = true;

    plugins = with pkgs.vimPlugins; [
      #themes
      gruvbox

      # air line
      vim-airline
      vim-airline-clock
      vim-airline-themes

      # nerdtree
      nerdtree
      nerdtree-git-plugin

      # golang
      vim-go
      deoplete-go

      # 
      telescope-nvim
      vim-polyglot

      # nix language
      vim-nix

      # others
      vimade
    ];

    extraConfig = ''
      " show numbers
      set number

      " show relative numbers
      set relativenumber

      " color scheme
      colorscheme gruvbox

      " show column ruler
      set colorcolumn=80

      " space as leader key
      nnoremap <space> <nop>
      let mapleader=' '

      " escape key
      inoremap jk <Esc>

      " Find files using Telescope command-line sugar.
      nnoremap <leader>pf <cmd>Telescope find_files<cr>
      nnoremap <leader>ps <cmd>Telescope live_grep<cr>
      nnoremap <leader>ss <cmd>Telescope buffers<cr>
      nnoremap <leader>hs <cmd>Telescope help_tags<cr>
    '';
  };
}
