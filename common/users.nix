{ pkgs, ... }:
{
	users.users.Dennis = {
		isNormalUser = true;
		description = "Dennis Lonoshchuk";
		extraGroups = [ "networkmanager" "wheel" "libvirtd" ];
	};
	home-manager.users.Dennis = import ./home_Dennis.nix;
}
