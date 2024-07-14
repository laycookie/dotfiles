{ pkgs, ... }:
{
	users.users.Dennis = {
		isNormalUser = true;
		description = "Dennis Lonoshchuk";
		extraGroups = [ "networkmanager" "wheel" "libvirtd" ];
	};
	imports = [ ./home_Dennis.nix ];
}
