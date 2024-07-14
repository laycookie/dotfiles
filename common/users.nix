{ pkgs, ... }:
{
	users.users.Dennis = {
		isNormalUser = true;
		description = "Dennis Lonoshchuk";
		extraGroups = [ "networkmanager" "wheel" "libvirtd" ];
		initialPassword = "1234";
	};
	imports = [ ./home_Dennis.nix ];
}
