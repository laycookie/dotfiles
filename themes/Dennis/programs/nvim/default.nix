{ config, pkgs, ... }:
{
	programs.neovim = {
		enable = true;
		extraPackages = with pkgs; [
			wl-clipboard
			tree-sitter
			unzip
			gcc
			nodejs_22
			python3
			luarocks
		];
	};

	xdg.configFile."nvim".recursive = true;
	xdg.configFile."nvim".source = ./config;
}
