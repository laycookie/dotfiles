{ config, pkgs, ... }:

{

  # Enable dconf (System Management Tool)
  dconf.enable = true;

  # Install necessary packages
  home.packages = with pkgs; [
    virt-manager
    virt-viewer
    spice spice-gtk
    spice-protocol
    win-virtio
    win-spice
    gnome.adwaita-icon-theme
  ];
}
