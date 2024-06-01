{ config, pkgs, ... }:
{
	programs.kitty = {
		enable = true;
		settings = {
			confirm_os_window_close = "0";
			window_padding_width = "10";
			shell = "zsh";
		};
		shellIntegration.enableZshIntegration = false;
	};
}
