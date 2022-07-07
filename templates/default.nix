{
  # nix flake init -t github:imgabe/dotfiles#templates.basic
  basic = {
    description = "A very basic flake";
    path = ./basic;
  };

  # nix flake init -t github:imgabe/dotfiles#templates.elm
  c = {
    description = "Go Project Template";
    path = ./c;
  };

  # nix flake init -t github:imgabe/dotfiles#templates.compat
  compat = {
    description = "Go Project Template";
    path = ./compat;
  };

  # nix flake init -t github:imgabe/dotfiles#templates.elm
  elm = {
    description = "Go Project Template";
    path = ./elm;
  };

  # nix flake init -t github:imgabe/dotfiles#templates.go
  go = {
    description = "Go Project Template";
    path = ./go;
  };


  python = {
    description = "Python Project template";
    path = ./python;
  };

  # nix flake init -t github:imgabe/dotfiles#templates.rust
  rust = {
    description = "Rust Project Template";
    path = ./rust;
  };
}
