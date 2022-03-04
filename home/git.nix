{
  programs.git = {
    enable = true;

    userName = "ImGabe";
    userEmail = "gabrielpmonte@hotmail.com";

    delta = {
      enable = true;
      options = {
        features = "side-by-side line-numbers decorations";
        delta = {
          navigate = true;
        };
        line-numbers = {
          line-numbers-minus-style = 124;
          line-numbers-plus-style = 28;
        };
      };
    };
  };
}
