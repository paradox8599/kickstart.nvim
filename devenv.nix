{ pkgs, ... }:
{
  # https://devenv.sh/basics/

  packages = [
    pkgs.git
  ];

  languages.rust.enable = true;
  languages.rust.channel = "nightly";

  # See full reference at https://devenv.sh/reference/options/
}
