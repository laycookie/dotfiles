{ config, lib, pkgs, ... }:

let
  wallpaper_random = pkgs.writeShellScriptBin "wallpaper_random" ''
    if command -v swww >/dev/null 2>&1; then 
	swww img $(find /etc/nixos/themes/Dennis/wallpapers -name "*.jpg" -o -name "*png" | shuf -n 1) --transition-type grow --transition-pos 0.0125,0.98 --transition-step 100 --transition-fps 144
    fi
  '';
in
{
  home.packages = with pkgs; [
    wallpaper_random
  ];
}
