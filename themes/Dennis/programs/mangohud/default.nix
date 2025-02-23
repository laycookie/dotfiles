{ config, lib, pkgs, ... }:
{
	programs.mangohud = {
		enable = true;
		settings = {
			full = true;
			engine_version = true;
			engine_short_names = true;
			frame_timing_detailed = true;
			historgram = true;

			font_scale = lib.mkForce 2.0;
		};
	};
}
