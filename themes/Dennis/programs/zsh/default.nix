{ config, pkgs, ... }:
{
    programs.zsh = {
        enable = true;
        oh-my-zsh = {
        	enable = true;
        	theme = "refined";
        	plugins = [
                    "git"
		    "direnv"
        	];
        };

        autosuggestion.enable = true;
        enableCompletion = true;
        syntaxHighlighting.enable = true;
    };
}
