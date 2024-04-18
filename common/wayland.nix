{ config, pkgs, inputs, ... }:
{
	programs.hyprland = {
	  enable = true;
	};
  environment.sessionVariables = {
    WLR_NO_HARDWARE_CURSORS = "1";
    # Hint Electron apps to use wayland
    #NIXOS_OZONE_WL = "1";
    "MOZ_ENABLE_WAYLAND" = "1"; # for firefox to run on wayland
    "MOZ_WEBRENDER" = "1";
    # for hyprland with nvidia gpu, ref https://wiki.hyprland.org/Nvidia/ I think this caused SDDM to not work.
    "LIBVA_DRIVER_NAME" = "nvidia";
    "GBM_BACKEND" = "nvidia-drm";
    "__GLX_VENDOR_LIBRARY_NAME" = "nvidia";
    "WLR_EGL_NO_MODIFIRES" = "1"; 
  };
}
