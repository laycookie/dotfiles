{ config, inputs, pkgs, ...}:
{
	imports = [ inputs.schizofox.homeManagerModule ];
	programs.schizofox = {
	enable = true;

	theme = {
		colors = {
			background-darker = config.stylix.base16Scheme.base00;
			background = config.stylix.base16Scheme.base01;
			foreground = config.stylix.base16Scheme.base04;
		};

		font = config.stylix.fonts.sansSerif.name;
	};
	
	search = {
		defaultSearchEngine = "Brave";
		
		addEngines = [
			{
				Name = "Brave";
				Description = "Seach Engine";
				Alias = "!brave";
				Method = "GET";
				URLTemplate = "https://search.brave.com/search?q={searchTerms}";
			}
		];
		removeEngines = ["Google" "Bing" "Amazon.com" "eBay" "Twitter" "Wikipedia"];
	    	searxUrl = "https://searx.work";
	    	searxQuery = "https://searx.work/search?q={searchTerms}&categories=general";
	};
	
	  security = {
	    sanitizeOnShutdown = false;
	    userAgent = "Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:106.0) Gecko/20100101 Firefox/106.0";
	  };
	
	  misc = {
	    drm.enable = false;
	    disableWebgl = false;
	    contextMenu.enable = true;
	    #startPageURL = "file://${builtins.readFile ./startpage.html}";

	  bookmarks = [
		{
			Title = "Ltt Labs";
			URL = "https://www.lttlabs.com";
		}
		{
			Title = "Excali Draw";
			URL = "https://excalidraw.com";
		}
	  ];
	  };
	

	  extensions = {
		enableExtraExtensions = true;
	  	extraExtensions = {
		# install url can be infered from `about:policies`
			"78272b6fa58f4a1abaac99321d503a20@proton.me".install_url = "https://addons.mozilla.org/firefox/downloads/latest/proton-pass/latest.xpi";
	  	};
	  };
	

	};
}
