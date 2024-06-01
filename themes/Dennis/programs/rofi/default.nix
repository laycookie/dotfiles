{ config, pkgs, ... }:
{
  programs.rofi = {
    enable = true;
    #terminal = "${pkgs.cool-retro-term}/bin/cool-retro-term";
    theme = ./theme.rasi;
    package = pkgs.rofi-wayland;
  };

  home.file.".config/rofi/theme.rasi".text = ''
* {
    main-bg:            #${config.stylix.base16Scheme.base00};
    main-fg:            #${config.stylix.base16Scheme.base05};
    main-br:            #${config.stylix.base16Scheme.base07};
    select-bg:          #${config.stylix.base16Scheme.base07};
    select-fg:          #${config.stylix.base16Scheme.base00};
    separatorcolor:     transparent;
    border-color:       transparent;
}

// Config //
configuration {
    modi:                        "drun,filebrowser,window,run";
    show-icons:                  true;
    display-drun:                " ";
    display-run:                 " ";
    display-filebrowser:         " ";
    display-window:              " ";
    drun-display-format:         "{name}";
    window-format:               "{w}{t}";
    font:                        "${config.stylix.fonts.monospace.name} 14";
    icon-theme:                  "Tela-circle-dracula";
}

// Main //
window {
    height:                     40em;
    width:                      25em;
    transparency:               "real";
    fullscreen:                 false;
    enabled:                    true;
    cursor:                     "default";
    spacing:                    0em;
    padding:                    0em;
    border:             	0.1em;
    border-radius:              1em 1em 1em 1em;
    border-color:		@main-br;
    background-color:           @main-bg;
}
mainbox {
    enabled:                     true;
    spacing:                     0em;
    padding:                     1em;
    orientation:                 vertical;
    children:                    [ "inputbar" , "listbox" ];
    background-color:            transparent;
}


// Inputs //
inputbar {
    enabled:                     true;
    spacing:                     0em;
    padding:                     4em;
    children:                    [ "entry" ];
    background-color:            @main-bg;
    background-image:            url("~/.cache/hyde/wall.thmb", width); // TODO: IMPORT WALLPAPER
    border-radius:               1em 1em 0em 0em;
}
entry {
    enabled:                     false;
}


// Lists //
listbox {
    spacing:                     0em;
    padding:                     0em;
    children:                    [ "dummyt" , "listview" , "dummyb" ];
    background-color:            @main-bg;
    border-radius:               0em 0em 1em 1em;
}
listview {
    enabled:                     true;
    spacing:                     0.4em;
    padding:                     1em;
    columns:                     1;
    lines:                       10;
    cycle:                       true;
    dynamic:                     true;
    scrollbar:                   false;
    layout:                      vertical;
    reverse:                     false;
    expand:                      false;
    fixed-height:                true;
    fixed-columns:               true;
    cursor:                      "default";
    background-color:            @main-bg;
    text-color:                  @main-fg;
}
dummyt {
    spacing:                     0em;
    padding:                     0em;
    background-color:            @main-bg;
}
dummyb {
    spacing:                     0em;
    padding:                     0em;
    background-color:            @main-bg;
    border-radius:               0em 0em 1em 1em;
}


// Elements //
element {
    enabled:                     true;
    spacing:                     1em;
    padding:                     0.2em 0.2em 0.2em 1.5em;
    border-radius:               1em 1em 1em 1em;
    cursor:                      pointer;
    background-color:            transparent;
    text-color:                  @main-fg;
}
element selected.normal {
    background-color:            @select-bg;
    text-color:                  @select-fg;
}
element-icon {
    size:                        2em;
    cursor:                      inherit;
    background-color:            transparent;
    text-color:                  inherit;
}
element-text {
    vertical-align:              0.5;
    horizontal-align:            0.0;
    cursor:                      inherit;
    background-color:            transparent;
    text-color:                  inherit;
}
'';
}
