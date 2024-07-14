{ config, pkgs, ...}:
{
	programs.eww = {
		enable = true;
		configDir = ./bar;
	};
}
