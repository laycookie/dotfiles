{ config, lib, pkgs, ... }:

let
  wallpaper_random = pkgs.writeShellScriptBin "wallpaper_random" ''
    if command -v swww >/dev/null 2>&1; then 
	swww img $(find /etc/nixos/themes/Dennis/wallpapers -name "*.jpg" -o -name "*png" | shuf -n 1) --transition-type grow --transition-pos 0.0125,0.98 --transition-step 100 --transition-fps 144
    fi
  '';
  prj = pkgs.writeShellScriptBin "prj" ''
	SELECTED_DIR=$(find ~/Projects -maxdepth 1 | fzf)

	if [ -n "$SELECTED_DIR" ]; then
		echo "cd '$SELECTED_DIR'"
		cd "$SELECTED_DIR"
	else
		echo 'No dir selected.'
	fi
  '';
in
{
  home.packages = with pkgs; [
    wallpaper_random
    prj
  ];
}
