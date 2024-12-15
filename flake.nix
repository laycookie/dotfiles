{
  description = "Nixos config flake";

  inputs = {
    # nixpkgs.url = "github:nixos/nixpkgs/nixos-24.05";
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
	home-manager = {
    		# url = "github:nix-community/home-manager/release-24.05";
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
		# rev = "a71207434c0bc2c8e05e94b1619e68059a002879";
	};
	stylix.url = "github:danth/stylix";
	# stylix = {
	# 	url = "https://github.com/laycookie/stylix";
	# 	type = "git";
	# 	rev = "1e5cfceb9a23ef824a4c4344c7958486d0663a5c";
	# };
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
