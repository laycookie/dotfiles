{ config, inputs, pkgs, ...}:
{
	#programs.firefox = {
	#	enable = true;
	#	profiles = {
        #		default = {
        # 			id = 0;
        # 	 		name = "laycookie";
        # 	 		isDefault = true;
	#			bookmarks = [
	#				{
	#					toolbar = true;
	#					bookmarks = [
	#					{
    	#						name = "Ltt Labs";
    	#						url = "https://www.lttlabs.com";
  	#					}
	#					{
    	#						name = "Excali Draw";
    	#						url = "https://excalidraw.com";
  	#					}
	#					];
	#				}
	#			];
	#			extensions = with inputs.firefox-addons.packages."x86_64-linux"; [
	#				ublock-origin
	#				proton-pass
	#			];
	#			#search.default = "DuckDuckGo";
	#		};

	#	};
	#};
}
