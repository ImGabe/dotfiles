{
  # nix flake init -t github:imgabe/dotfiles#templates.basic
  basic = {
    description = "A very basic flake";
    path = ./basic;
  };

  # nix flake init -t github:imgabe/dotfiles#templates.compat
  compat = {
    description = "Go Project Template";
    path = ./go;
  };

  # nix flake init -t github:imgabe/dotfiles#templates.elm
  elm = {
    description = "Go Project Template";
    path = ./go;
  };

  # nix flake init -t github:imgabe/dotfiles#templates.go
  go = {
    description = "Go Project Template";
    path = ./go;
  };

  # nix flake init -t github:imgabe/dotfiles#templates.rust
  rust = {
    description = "Rust Project Template";
    path = ./rust;
  };
}
