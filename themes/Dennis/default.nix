{config, lib, pkgs, ... }:
{
  imports = [
    ./vm.nix
    ./programs
    ./scripts
    ./cava
  ];
	stylix = {
 		enable = true;
 		# image = ./wallpapers/menhera.jpg;

 		targets.rofi.enable = false;
 	       	targets.waybar.enable = false;

 	       	 polarity = "dark";

	 	iconTheme = {
			enable = true;
	 		package = pkgs.reversal-icon-theme;
	 		light = "Reversal";
	 		dark = "Reversal";
	 	};
 	       	base16Scheme = {
 	       		base00 = "282828";
 	       		base01 = "3c3836";
 	       		base02 = "504945";
 	       		base03 = "665c54";
 	       		base04 = "bdae93";
 	       		base05 = "d5c4a1";
 	       		base06 = "ebdbb2";
 	       		base07 = "fbf1c7";
 	       		base08 = "fb4934";
 	       		base09 = "fe8019";
 	       		base0A = "fabd2f";
 	       		base0B = "b8bb26";
 	       		base0C = "8ec07c";
 	       		base0D = "83a598";
 	       		base0E = "d3869b";
 	       		base0F = "d65d0e";
 	       	};
 	       	cursor = {
 	       		package = pkgs.bibata-cursors;
 	       		name = "Bibata-Modern-Classic";
 	       		size = 24;
 	       	};
 	       	fonts = {
 	       		sizes = {
 	       			terminal = 14;
 	       			desktop = 12;
 	       		};

 	       		monospace = {
 	       			package = pkgs.nerd-fonts.jetbrains-mono;
 	       			name = "JetBrainsMono Nerd Font Mono";
 	       		};
 	       		sansSerif = {
 	       			package = pkgs.dejavu_fonts;
 	       			name = "DejaVu Sans";
 	       		};
 	       		serif = {
 	       			package = pkgs.dejavu_fonts;
 	       			name = "DejaVu Serif";
 	       		};
 	       	};
 	};
}
