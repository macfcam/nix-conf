{ config, pkgs, ... }:

{
  programs.git = {
    enable = true;

    # Default identity
    userName = "Marcelo Alves";
    userEmail = "alvesmarcelocf@proton.me";

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

    extraConfig = {
      pull.rebase = true;
    };
  };
}
