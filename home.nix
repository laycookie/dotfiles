{ config, pkgs, ... }:

{
  imports = [ ./themes/Dennis ];

  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home = {
    username = "Dennis";
    homeDirectory = "/home/Dennis";
  };
	nixpkgs = {
  		config.allowUnfree = true;
	}

  home.stateVersion = "unstable";
  home.file = {};

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
