{ pkgs, lib, config, inputs, ... }:

{
  # https://devenv.sh/packages/
  packages = with pkgs; [
    exercism
  ];

  # https://devenv.sh/languages/
  languages = {
    crystal.enable = true;
    rust.enable = true;
  };

  git-hooks.hooks = {
    trim-trailing-whitespace.enable = true;
    end-of-file-fixer.enable = true;
    check-yaml.enable = true;
    check-json.enable = true;
    check-merge-conflicts.enable = true;
    check-added-large-files.enable = true;
    detect-private-keys.enable = true;
  };

  scripts = {
    exercism-cfg.exec = "exercism configure --workspace=. --token=$1";
  };

  # See full reference at https://devenv.sh/reference/options/
}
