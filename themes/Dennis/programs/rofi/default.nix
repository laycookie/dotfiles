{ config, pkgs, ... }:
{
  programs.rofi = {
    enable = true;
    terminal = "${pkgs.cool-retro-term}/bin/cool-retro-term";
    theme = ./theme.rasi;
    package = pkgs.rofi-wayland;
  };

  home.file.".config/rofi/theme.rasi".text = ''
// Config //
configuration {
    modi:                        "drun,filebrowser,window,run";
    show-icons:                  true;
    display-drun:                "";
    display-run:                 "";
    display-filebrowser:         "";
    display-window:              "";
    drun-display-format:         "{name}";
    window-format:               "{w}{t}";
    font:                        "JetBrainsMono Nerd Font 10";
  
  icon-theme:                  "Tela-circle-dracula";
}

// @theme "./colors/dracula.rasi"
* {
    main-bg:            #dce0e8e6;
    main-fg:            #4c4f69ff;
    main-br:            #9ca0b0ff;
    main-ex:            #8839efff;
    select-bg:          #dd7878ff;
    select-fg:          #eff1f5ff;
    separatorcolor:     transparent;
    border-color:       transparent;
}

// Main //
window {
    height:                      590px;
    width:                       1140px;
    transparency:                "real";
    fullscreen:                  false;
    enabled:                     true;
    cursor:                      "default";
    spacing:                     0px;
    padding:                     0px;
    border:                      2px;
    border-radius:               40px;
    border-color:                @main-br;
    background-color:            transparent;
}
mainbox {
    enabled:                     true;
    spacing:                     0px;
    orientation:                 horizontal;
    children:                    [  "inputbar" , "listbox" ];
    background-color:            transparent;
    background-image:            url("~/.config/swww/wall.blur", height);
}

// Inputs //
inputbar {
    enabled:                     true;
    width:                       640px;
    children:                    [ "mode-switcher" , "entry" ];
    background-color:            transparent;
    background-image:            url("~/.config/swww/wall.rofi", height);
}
entry {
    enabled:                     false;
}


// Modes //
mode-switcher{
    orientation:                 vertical;
    enabled:                     true;
    spacing:                     0px;
    width:                       68px;
    padding:                     160px 10px 160px 10px;
    spacing:                     25px;
    background-color:            transparent;
    background-image:            url("~/.config/swww/wall.blur", height);
}
button {
    cursor:                      pointer;
    vertical-align:              0.50;
    horizontal-align:            0.45;
    border-radius:               50px;
    background-color:            @main-bg;
    text-color:                  @main-fg;
}
button selected {
    background-color:            @main-fg;
    text-color:                  @main-bg;
}

// Lists //
listbox {
    spacing:                     10px;
    padding:                     30px;
    children:                    [ "listview" ];
    background-color:            @main-bg;
}
listview {
    enabled:                     true;
    columns:                     1;
    cycle:                       true;
    dynamic:                     true;
    scrollbar:                   false;
    layout:                      vertical;
    reverse:                     false;
    fixed-height:                true;
    fixed-columns:               true;
    cursor:                      "default";
    background-color:            transparent;
    text-color:                  @main-fg;
}

// Elements //
element {
    enabled:                     true;
    spacing:                     30px;
    padding:                     8px;
    border-radius:               20px;
    cursor:                      pointer;
    background-color:            transparent;
    text-color:                  @main-fg;
}
@media(max-aspect-ratio: 1.8) {
    element {
        orientation:             vertical;
    }
}
element selected.normal {
    background-color:            @select-bg;
    text-color:                  @select-fg;
}
element-icon {
    size:                        48px;
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