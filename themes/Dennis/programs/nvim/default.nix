{ config, pkgs, ... }:
{
	programs.neovim = {
		enable = true;
		package = pkgs.neovim-nightly;
		extraPackages = with pkgs; [
			wl-clipboard
			tree-sitter
			unzip
			gcc
		];
	};

	xdg.configFile."nvim".recursive = true;
	xdg.configFile."nvim".source = ./config;
}
