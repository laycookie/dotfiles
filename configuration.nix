# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

{ pkgs,
  inputs,
  outputs,
  config,
  lib,
  hostname,
  username,
  stateVersion,
  ... }:
let
  themes = pkgs.callPackage  ../common/configs/themes.nix {};
in

{
  imports =
    [ # Include the results of the hardware scan.
	./hardware-configuration.nix
	./common/common_pkgs.nix
 	./common/wayland.nix
	./common/users.nix
	./common/configs/fonts.nix
    ];
	# TODO: Move to themes (Set wallpaper)
	stylix.image = pkgs.fetchurl {
		url = "https://www.pixelstalk.net/wp-content/uploads/2016/05/Epic-Anime-Awesome-Wallpapers.jpg";
		sha256 = "enQo3wqhgf0FEPHj2coOCvo7DuZv+x5rL/WIo4qPI50=";
	};
	stylix.polarity = "dark";
	stylix.homeManagerIntegration.followSystem = false;

	home-manager.extraSpecialArgs = { inherit inputs; };
	home-manager.useGlobalPkgs = true;

	# Allow unfree software
	nixpkgs.config = {
		allowUnfree = true;
		cudaSupport = true;
	};

	# bootloader.
	boot.loader = {
		systemd-boot.enable = true;
		efi.canTouchEfiVariables = true;
	};

	boot.kernelParams = [ 
		"nvidia.NVreg_PreserveVideoMemoryAllocations=1"
		# "nvidia-drm.modest=1"
	];

	environment.variables = {
  	  EDITOR = "nvim";
  	  SUDO_EDITOR="nvim";
  	  BROWSER = "schizofox";
  	  TERMINAL = "kitty";
  	  TERM = "kitty";
  	};

	hardware.bluetooth.enable = true;
	
	hardware.enableAllFirmware = true;

  	hardware.opengl = {
  	  enable = true;
	  # enable32Bit = true;
  	};

  	# Nvidia support
  	services.xserver.videoDrivers = [ "nvidia" ];

  	hardware.nvidia = {
  	  modesetting.enable = true;
  	  powerManagement.enable = true;
  	  powerManagement.finegrained = false;
  	  open = false; # open source drivers
  	  nvidiaSettings = true;
  	  package = config.boot.kernelPackages.nvidiaPackages.production;
  	};


	# Pick only one of the below networking options.
  	# networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.
  	networking.networkmanager.enable = true;  # Easiest to use and most distros use this by default
  	
  	# Enable the X11 windowing system.
  	services.xserver.enable = true;

  	# Enable the GNOME/KDE Desktop Environment.
  	services.xserver.displayManager.gdm.enable = true;
	# services = {
	# 	displayManager = {
	# 		sddm = {
	# 			enable = true;
	# 			wayland.enable = true;
	# 		};
	# 	};
	# };
	# services.xserver.desktopManager.plasma5.enable = true;

  	# swaylock stuff
  	security.pam.services.swaylock = {};

  	# enable pipewire
  	security.rtkit.enable = true;
  	services.pipewire = {
  	      enable = true;
	      alsa.enable = true;
  	      alsa.support32Bit = true;
  	      pulse.enable = true;
  	      jack.enable = true;
  	};

	# Manage the virtualisation services
	# virtualisation = {
	# 	libvirtd = {
	# 		enable = true;
	# 		qemu = {
	# 			swtpm.enable = true;
        # 			ovmf.enable = true;
        # 			ovmf.packages = [ pkgs.OVMFFull.fd ];
	# 		};
	# 	};
	# 	spiceUSBRedirection.enable = true;
	# };
	# hardware.enableRedistributableFirmware = lib.mkDefault true;
  	# services.spice-vdagentd.enable = true;

  # services.xserver.displayManager.sddm = {
  #  enable = true;
  #  enableHidpi = true;
  #  theme = "abstractguts-themes";
  # };
  

  # Configure keymap in X11
  # services.xserver.xkb.layout = "us";
  # services.xserver.xkb.options = "eurosign:e,caps:escape";

  # Enable CUPS to print documents.
  # services.printing.enable = true;

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # Garbage colector
  nix.gc = {
    automatic = true;
    dates = "weakly";
    options = "--delete-older-than 7d";
  };

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # Copy the NixOS configuration file and link it from the resulting system
  # (/run/current-system/configuration.nix). This is useful in case you
  # accidentally delete configuration.nix.
  # system.copySystemConfiguration = true;

  # This option defines the first version of NixOS you have installed on this particular machine,
  # and is used to maintain compatibility with application data (e.g. databases) created on older NixOS versions.
  #
  # Most users should NEVER change this value after the initial install, for any reason,
  # even if you've upgraded your system to a new NixOS release.
  #
  # This value does NOT affect the Nixpkgs version your packages and OS are pulled from,
  # so changing it will NOT upgrade your system.
  #
  # This value being lower than the current NixOS release does NOT mean your system is
  # out of date, out of support, or vulnerable.
  #
  # Do NOT change this value unless you have manually inspected all the changes it would make to your configuration,
  # and migrated your data accordingly.
  #
  # For more information, see `man configuration.nix` or https://nixos.org/manual/nixos/stable/options#opt-system.stateVersion .
  system.stateVersion = "23.11"; # Did you read the comment?

}

