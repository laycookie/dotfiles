{ config, pkgs, ... }:
{
	programs.neovim = {
		enable = true;
		# package = pkgs.neovim-nightly;
		extraPackages = with pkgs; [
			wl-clipboard
			tree-sitter
			unzip
			gcc
			python3
		];
	};

	xdg.configFile."nvim".recursive = true;
	xdg.configFile."nvim".source = ./config;
}
