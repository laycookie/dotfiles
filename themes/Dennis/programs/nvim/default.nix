{ config, pkgs, ... }:
{
	programs.neovim = {
		enable = true;
<<<<<<< HEAD
		# package = pkgs.neovim-unwrapped.overrideAttrs (prev: {
		# 	src = pkgs.fetchFromGitHub {
		# 		# fill in the repo and hash and stuff here
		# 		owner = "neovim";
		# 		repo = "neovim";
		# 		rev = "v0.10.1";
		# 		hash = "sha256-OsHIacgorYnB/dPbzl1b6rYUzQdhTtsJYLsFLJxregk=";
		# 	};
		# });
=======
>>>>>>> 56e0790
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
