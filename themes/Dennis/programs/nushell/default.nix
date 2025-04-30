{ config, pkgs, ... }:
{
	programs = {
		nushell = { 
  			enable = true;
  		    	configFile.source = ./config.nu;
			environmentVariables = {
				EDITOR = "nvim";
			};
		};
		carapace = {
 			enable = true;
			enableNushellIntegration = true;
		};


  		starship = { 
  		 	enable = true;
			settings = {
  		      		add_newline = true;
  		      		character = { 
  		       			success_symbol = "[➜](bold green)";
  		       			error_symbol = "[➜](bold red)";
  		      		};
  		      	};
  		};
	};
}
