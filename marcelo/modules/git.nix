{ config, pkgs, ... }:

{
  programs.git = {
    enable = true;

    # Default identity
    settings = {
      user = {
        name = "Marcelo Alves";
        email = "alvesmarcelocf@proton.me";
      };
    };

    # Conditional includes for work identity
    includes = [
      {
        condition = "gitdir:~/Renner/";
        contents = {
          user = {
            name = "Marcelo Alves Cardoso Filho";
            email = "marcelo.filho@lojasrenner.com.br";
          };
        };
      }
    ];

    # Additional settings
    settings = {
      pull.rebase = true;
    };
  };
}
