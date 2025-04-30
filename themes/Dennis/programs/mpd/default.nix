{ config, pkgs, ... }:
{
	services.mpd = {
		enable = true;

		musicDirectory = "/home/Dennis/Music";
		extraConfig = ''
		audio_output {
			type "pipewire"
			name "Pipewire"
			mixer_type      "hardware"      # optional
			mixer_device    "default"       # optional
			mixer_control   "PCM"           # optional
			mixer_index     "0"             # optional
		}
		'';

		# Optional:
  		# network.listenAddress = "any"; # if you want to allow non-localhost connections
  		# network.startWhenNeeded = true; # systemd feature: only start MPD service upon connection to its socket
	};
	xdg.configFile."mpd".recursive = true;
	xdg.configFile."mpd".source = ./config;
}
