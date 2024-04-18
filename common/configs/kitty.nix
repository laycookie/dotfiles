{ pkgs, colors, ... }:
with colors; {
  programs.kitty = {
    enable = true;
    extraConfig=''
						font_family      Dank Mono Regular
						bold_font        Fira Code Bold Nerd Font Complete
						italic_font      Dank Mono Italic
                        bold_italic_font Fira Code SemiBold Nerd Font Complete
						symbol_map U+1F980 Noto Color Emoji
						enable_audio_bell no
						# background_opacity 0.6
						background_tint 0.6
						dim_opacity 0.6
						shell zsh
                        font_size 12
						map ctrl+shift+enter	launch	--cwd=current --type=os-window
                        include ~/.cache/wal/colors-kitty.conf
                        confirm_os_window_close 0
    '';#I honestly have no clue why, but passing these options as settings {}; 
    	 #breaks opacity in my setup.... Could it be formatting?
	};
}
