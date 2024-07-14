{ config, lib, pkgs, inputs, ... }:
{
	imports = with inputs.niri; [ homeModules.stylix homeModules.niri ];
	stylix.targets.niri.enable = true;
	programs.niri = {
		enable = true;
		# package = pkgs.niri-unstable;

		config = ''
			spawn-at-startup "waybar"

			binds {
				Mod+C { close-window; }

				// Apps
				Mod+Q { spawn "kitty"; }
				Mod+E { spawn "nautilus"; }
				Mod+B { spawn "firefox"; }
				Mod+D { spawn "webcord"; }
				Mod+T { spawn "telegram-desktop"; }

				// Widgets
				Mod+M { spawn "wlogout"; }
				Mod+Space { spawn "rofi -show"; }

				// Movement
				Mod+Left { focus-column-left; }
				Mod+Right { focus-column-right; }
				Mod+H { focus-column-left; }
				Mod+L { focus-column-right; }
				Mod+WheelScrollRight	cooldown-ms=150 { focus-column-right; }
				Mod+WheelScrollLeft	cooldown-ms=150 { focus-column-left; }


				Mod+1 { focus-workspace 1; }
				Mod+2 { focus-workspace 2; }
				Mod+3 { focus-workspace 3; }
				Mod+4 { focus-workspace 4; }
				Mod+5 { focus-workspace 5; }
				Mod+6 { focus-workspace 6; }
				Mod+7 { focus-workspace 7; }
				Mod+8 { focus-workspace 8; }
				Mod+9 { focus-workspace 9; }
				Mod+Shift+1 { move-column-to-workspace 1; }
				Mod+Shift+2 { move-column-to-workspace 2; }
				Mod+Shift+3 { move-column-to-workspace 3; }
				Mod+Shift+4 { move-column-to-workspace 4; }
				Mod+Shift+5 { move-column-to-workspace 5; }
				Mod+Shift+6 { move-column-to-workspace 6; }
				Mod+Shift+7 { move-column-to-workspace 7; }
				Mod+Shift+8 { move-column-to-workspace 8; }
				Mod+Shift+9 { move-column-to-workspace 9; }

				Mod+G { maximize-column; }
				Mod+Shift+G { fullscreen-window; }

				print { screenshot; }
				Ctrl+print { screenshot-screen; }
				Alt+print { screenshot-window; }
			}

			input {
				keyboard {
					xkb {
						layout "us,ru"
						options "grp:alt_shift_toggle"
					}

					repeat-delay 350
					repeat-rate 35
				}
				warp-mouse-to-focus
			}
			screenshot-path "~/Pictures/Screenshots/%Y-%m-%d_%H-%M-%S.png"
		'';
	};
}
