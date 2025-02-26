{ pkgs, ...}:
{
    nixpkgs.overlays = [
    (self: super: {
      mpv = super.mpv.override {
        scripts = [ self.mpvScripts.mpris self.mpvScripts.sponsorblock self.mpvScripts.thumbfast ];
      };
    })
  ];
  environment.systemPackages = with pkgs; [
  	nvd
	git
    	neovim
    	wget
    	du-dust
    	btop
    	usbutils
    	ripgrep
    	lm_sensors
    	zellij
    	nushell
  ];
}
