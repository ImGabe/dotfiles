{
  # nix flake init -t github:imgabe/dotfiles#templates.c
  c = {
    description = "C Project Template";
    path = ./c;
  };

  # nix flake init -t github:imgabe/dotfiles#templates.go
  go = {
    description = "Go Project Template";
    path = ./go;
  };

  # nix flake init -t github:imgabe/dotfiles#templates.haskell
  haskell = {
    description = "Haskell Project Template";
    path = ./haskell;
  };

  # nix flake init -t github:imgabe/dotfiles#templates.rust
  rust = {
    description = "Rust Project Template";
    path = ./rust;
  };
}
