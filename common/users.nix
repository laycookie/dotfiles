{ pkgs, ... }:
{
	users.users.Dennis = {
		isNormalUser = true;
		description = "Dennis Lonoshchuk";
		extraGroups = [ "networkmanager" "wheel" "libvirtd" ];
		initialPassword = "43210";
		shell = pkgs.nushell;
	};
	imports = [ ./home_Dennis.nix ];
}
