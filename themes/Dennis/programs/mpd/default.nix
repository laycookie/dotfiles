{ config, pkgs, ... }:
{
	services.mpd = {
		enable = true;
		musicDirectory = "~/Music";
		extraConfig = ''
		audio_output {
			type "pulse"
			name "Pulseaudio"
			mixer_type      "hardware"      # optional
			mixer_device    "default"       # optional
			mixer_control   "PCM"           # optional
			mixer_index     "0"             # optional
		}
		'';
	};
}
