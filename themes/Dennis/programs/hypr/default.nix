{ config, lib, pkgs, inputs, ... }:

{
  imports = [ 
    ./hyprland-environment.nix
  ];

  #test later systemd.user.targets.hyprland-session.Unit.Wants = [ "xdg-desktop-autostart.target" ];
  wayland.windowManager.hyprland = {
    enable = true;
    # package = inputs.hyprland.packages.${pkgs.system}.hyprland;
    systemd.enable = true;
    extraConfig = ''
    # Monitor
    monitor=DP-1,3840x2160@60,auto,1.5
    monitor=DP-2,2560x1440@144,auto,1 
    monitor=Unknown-1,disable 

    xwayland {
        force_zero_scaling = true
    }

    exec-once = swww init & sleep 0.5 && exec wallpaper_random
    exec-once = wl-paste --watch cliphist store
    # exec = pkill waybar & sleep 0.5 && waybar
    exec = pkill .eww_wrapped & sleep 0.2 && eww daemon && eww open bar
    # exec-once = wallpaper_random

    # Set en layout at startup

    # Input config
    input {
        kb_layout = us,ru
        kb_variant =
        kb_model =
        kb_options = grp:alt_shift_toggle
        kb_rules =

        follow_mouse = 1

        touchpad {
            natural_scroll = false
        }

        sensitivity = 0 # -1.0 - 1.0, 0 means no modification.
    }

    general {

        gaps_in = 5
        gaps_out = 20
        border_size = 2
        col.active_border = rgb(${config.stylix.base16Scheme.base07})
        col.inactive_border = rgba(595959aa)

        layout = dwindle
    }

    decoration {
        rounding = 10

        # drop_shadow = true
        # shadow_range = 4
        # shadow_render_power = 3
        # col.shadow = rgba(1a1a1aee)
    }

    animations {
        enabled = yes

        bezier = ease,0.4,0.02,0.21,1

        animation = windows, 1, 3.5, ease, slide
        animation = windowsOut, 1, 3.5, ease, slide
        animation = border, 1, 6, default
        animation = fade, 1, 3, ease
        animation = workspaces, 1, 3.5, ease
    }

    dwindle {
        pseudotile = yes
        preserve_split = yes
    }

    # master {
    #     new_is_master = yes
    # }

    gestures {
        workspace_swipe = false
    }

    # Example windowrule v1
    # Example windowrule v2

    # windowrule=float,^(pavucontrol)$
    # windowrule=float,^(blueman-manager)$
    # windowrule=size 934 525,^(mpv)$
    # windowrule=float,^(mpv)$
    # windowrule=center,^(mpv)$
    #windowrule=pin,^(firefox)$

    $mainMod = SUPER
    bind = $mainMod, G, fullscreen,


    # Apps shortcuts
    bind = $mainMod, SPACE, 	exec,	wofi --show drun
    bind = $mainMod, R, 	exec,	wofi --show run
    bind = $mainMod, H, 	exec,	cliphist list | wofi -S dmenu | cliphist decode | wl-copy
    bind = $mainMod, M, 	exec,	wlogout
    bind = $mainMod, Q, 	exec,	kitty
    bind = $mainMod, D, 	exec,	discordcanary --enable-features=UseOzonePlatform --ozone-platform=wayland
    bind = $mainMod, S, 	exec,	steam
    bind = $mainMod, E, 	exec,	yazi
    bind = $mainMod, T, 	exec,	telegram-desktop
    bind = $mainMod, B, 	exec,	firefox	
    bind = $mainMod, C,		killactive,
    bind = $mainMod, F, 	togglefloating,
    bind = $mainMod, V, 	togglesplit,

    # Move focus
    bind = $mainMod, H, movefocus, l
    bind = $mainMod, L, movefocus, r
    bind = $mainMod, K, movefocus, u
    bind = $mainMod, J, movefocus, d

    bind = $mainMod SHIFT, H, movewindow, l
    bind = $mainMod SHIFT, L, movewindow, r
    bind = $mainMod SHIFT, K, movewindow, u
    bind = $mainMod SHIFT, J, movewindow, d

    # Screenshots
    bind = , Print, exec, grim -g "$(slurp)" - | wl-copy
    bind = SHIFT, Print, exec, grim -g "$(slurp)"

    # Functional keybinds
    bind =,XF86AudioMicMute,exec,pamixer --default-source -t
    bind =,XF86MonBrightnessDown,exec,light -U 20
    bind =,XF86MonBrightnessUp,exec,light -A 20
    bind =,XF86AudioMute,exec,pamixer -t
    bind =,XF86AudioLowerVolume,exec,pamixer -d 10
    bind =,XF86AudioRaiseVolume,exec,pamixer -i 10
    bind =,XF86AudioPlay,exec,playerctl play-pause
    bind =,XF86AudioPause,exec,playerctl play-pause

    # to switch between windows in a floating workspace
    bind = SUPER,Tab,cyclenext,
    bind = SUPER,Tab,bringactivetotop,

    # Move focus with mainMod + arrow keys
    bind = $mainMod, left, movefocus, l
    bind = $mainMod, right, movefocus, r
    bind = $mainMod, up, movefocus, u
    bind = $mainMod, down, movefocus, d

    # Switch workspaces with mainMod + [0-9]
    bind = $mainMod, 1, workspace, 1
    bind = $mainMod, 2, workspace, 2
    bind = $mainMod, 3, workspace, 3
    bind = $mainMod, 4, workspace, 4
    bind = $mainMod, 5, workspace, 5
    bind = $mainMod, 6, workspace, 6
    bind = $mainMod, 7, workspace, 7
    bind = $mainMod, 8, workspace, 8
    bind = $mainMod, 9, workspace, 9
    bind = $mainMod, 0, workspace, 10

    # Move active window to a workspace with mainMod + SHIFT + [0-9]
    bind = $mainMod SHIFT, 1, movetoworkspace, 1
    bind = $mainMod SHIFT, 2, movetoworkspace, 2
    bind = $mainMod SHIFT, 3, movetoworkspace, 3
    bind = $mainMod SHIFT, 4, movetoworkspace, 4
    bind = $mainMod SHIFT, 5, movetoworkspace, 5
    bind = $mainMod SHIFT, 6, movetoworkspace, 6
    bind = $mainMod SHIFT, 7, movetoworkspace, 7
    bind = $mainMod SHIFT, 8, movetoworkspace, 8
    bind = $mainMod SHIFT, 9, movetoworkspace, 9
    bind = $mainMod SHIFT, 0, movetoworkspace, 10

    # Scroll through existing workspaces with mainMod + scroll
    bind = $mainMod, mouse_down, workspace, e+1
    bind = $mainMod, mouse_up, workspace, e-1

    # Move/resize windows with mainMod + LMB/RMB and dragging
    bindm = $mainMod, mouse:272, movewindow
    bindm = $mainMod, mouse:273, resizewindow
        '';
  };

      home.file.".config/hypr/colors".text = ''
$background = rgba(1d192bee)
$foreground = rgba(c3dde7ee)

$color0 = rgba(1d192bee)
$color1 = rgba(465EA7ee)
$color2 = rgba(5A89B6ee)
$color3 = rgba(6296CAee)
$color4 = rgba(73B3D4ee)
$color5 = rgba(7BC7DDee)
$color6 = rgba(9CB4E3ee)
$color7 = rgba(c3dde7ee)
$color8 = rgba(889aa1ee)
$color9 = rgba(465EA7ee)
$color10 = rgba(5A89B6ee)
$color11 = rgba(6296CAee)
$color12 = rgba(73B3D4ee)
$color13 = rgba(7BC7DDee)
$color14 = rgba(9CB4E3ee)
$color15 = rgba(c3dde7ee)
    '';
}
