{
  description = "Nixos config flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
	home-manager = {
    		url = "github:nix-community/home-manager";
    	  	inputs.nixpkgs.follows = "nixpkgs";
    	};	
	niri = { 
		url = "github:sodiboo/niri-flake";
		inputs.nixpkgs.follows = "nixpkgs";
	};
	hyprland = { 
    		url = "github:hyprwm/Hyprland";
		# url = "https://github.com/hyprwm/Hyprland";
		# type = "git";
		# submodules = true;
# addd3e7f1aeb670dd91d26005aaeccce3efb1ae7
		# rev = "a71207434c0bc2c8e05e94b1619e68059a002879";
	};
    stylix.url = "github:danth/stylix";
    schizofox.url = "github:schizofox/schizofox";

  };

  outputs = { self, nixpkgs, home-manager, hyprland, ... }@inputs:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
      lib = nixpkgs.lib;
    in
    {
      nixosConfigurations.default = nixpkgs.lib.nixosSystem {
          specialArgs = {inherit inputs;};
          modules = [ 
            ./configuration.nix
            inputs.home-manager.nixosModules.default
	    inputs.stylix.nixosModules.stylix
          ];
        };

    };
}
