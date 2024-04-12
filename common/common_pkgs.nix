{ pkgs, ...}:
{
    nixpkgs.overlays = [
    (self: super: {
      mpv = super.mpv.override {
        scripts = [ self.mpvScripts.mpris self.mpvScripts.sponsorblock self.mpvScripts.thumbfast];
      };
    })
  ];
  environment.systemPackages = with pkgs; [
    # Neovim Deps
    nodejs_21
    lua-language-server
    python311
    git
    kitty
    neovim
    wget
    python311Packages.pip
    du-dust
    btop
    usbutils
    ripgrep
    lm_sensors
    zellij
    zsh
    neofetch

    waybar
  ];
}
