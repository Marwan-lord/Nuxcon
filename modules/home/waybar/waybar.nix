{
  lib,
  config,
  pkgs,
  ...
}:

{

  options = {
    home.waybar.enable = lib.mkEnableOption "Enables waybar";
  };

  config = lib.mkIf config.home.waybar.enable {
    stylix.targets.waybar.enable = false;
    programs.waybar.enable = true;

    programs.waybar.settings = {
      mainBar = {
        layer = "top";
        position = "right";
        margin = "5 8 5 0";
        reload_style_on_change = true;
        modules-left = [
          "custom/updates"
          "group/info"
        ];
        "group/info" = {
          orientation = "inherit";
          drawer = {
            transition-duration = 500;
            transition-left-to-right = false;
          };
          modules = [
            "custom/dmark"
            "custom/power"
            "group/gcpu"
            "memory"
            "disk"
          ];
        };

        "custom/dmark" = {
          format = "";
          tooltip = false;
        };
        "group/gcpu" = {
          orientation = "inherit";
          modules = [
            "custom/cpu-icon"
            "cpu"
          ];
        };
        "custom/cpu-icon" = {
          format = "󰻠";
          tooltip = false;
        };
        cpu = {
          format = "<b>{usage}󱉸</b>";
          on-click = "foot btop";
        };
        memory = {
          format = "<b>  \n{:2}󱉸</b>";
        };
        disk = {
          interval = 600;
          format = "<b> 󰋊 \n{percentage_used}󱉸</b>";
          path = "/";
        };
        modules-right = [
          "group/brightness"
          "group/sound"
          "group/connection"
          "tray"
          "group/power"
        ];
        "custom/recorder" = {
          format = "{}";
          interval = "once";
          exec = "echo ''";
          tooltip = "false";
          exec-if = "pgrep 'wl-screenrec'";
          on-click = "recorder";
          signal = 4;
        };
        privacy = {
          orientation = "vertical";
          icon-spacing = 4;
          icon-size = 14;
          transition-duration = 250;
          modules = [
            {
              type = "screenshare";
              tooltip = true;
              tooltip-icon-size = 24;
            }
          ];
        };
        "group/brightness" = {
          orientation = "inherit";
          drawer = {
            transition-duration = 500;
            transition-left-to-right = false;
          };
          modules = [
            "backlight"
            "backlight/slider"
          ];
        };
        backlight = {
          device = "intel_backlight";
          format = "{icon}";
          format-icons = [
            ""
            ""
            ""
            ""
            ""
            ""
            ""
            ""
            ""
            ""
            ""
            ""
            ""
            ""
            ""
          ];
          on-scroll-down = "brightnessctl s 5%-";
          on-scroll-up = "brightnessctl s +5%";
          tooltip = true;
          tooltip-format = "Brightness: {percent}% ";
          smooth-scrolling-threshold = 1;
        };
        "backlight/slider" = {
          min = 5;
          max = 100;
          orientation = "vertical";
          device = "intel_backlight";
        };
        "group/sound" = {
          orientation = "inherit";
          modules = [
            "group/audio"
            "group/together"
            "custom/notifications"
          ];
        };
        "group/audio" = {
          orientation = "inherit";
          drawer = {
            transition-duration = 500;
            transition-left-to-right = false;
          };
          modules = [
            "pulseaudio"
            "pulseaudio#mic"
            "pulseaudio/slider"
          ];
        };
        "group/cnoti" = {
          orientation = "inherit";
          modules = [
            "custom/github"
          ];
        };
        "group/connection" = {
          orientation = "inherit";
          modules = [
            "group/network"
          ];
        };
        "group/together" = {
          orientation = "inherit";
          modules = [
            "clock"
          ];
        };
        "group/utils" = {
          orientation = "inherit";
          drawer = {
            transition-duration = 500;
            transition-left-to-right = true;
          };
          modules = [
            "custom/mark"
            "custom/weather"
            "custom/colorpicker"
            "custom/hyprshade"
            "idle_inhibitor"
            "custom/hyprkill"
          ];
        };
        "group/network" = {
          orientation = "inherit";
          drawer = {
            transition-duration = 500;
            transition-left-to-right = true;
          };
          modules = [
            "network"
            "network#speed"
          ];
        };
        "group/bluetooth" = {
          orientation = "inherit";
          drawer = {
            transition-duration = 500;
            transition-left-to-right = true;
          };
          modules = [
            "bluetooth"
            "bluetooth#status"
          ];
        };
        "group/power" = {
          orientation = "inherit";
          drawer = {
            transition-duration = 500;
            transition-left-to-right = false;
          };
          modules = [
            "battery"
          ];
        };
        tray = {
          icon-size = 18;
          spacing = 10;
        };
        pulseaudio = {
          format = "{icon}";
          format-bluetooth = "{icon}";
          tooltip-format = "{volume}% {icon} | {desc}";
          format-muted = "󰖁";
          format-icons = {
            headphones = "󰋌";
            handsfree = "󰋌";
            headset = "󰋌";
            phone = "";
            portable = "";
            car = " ";
            default = [
              "󰕿"
              "󰖀"
              "󰕾"
            ];
          };
          on-click = "volume mute";
          on-click-middle = "pavucontrol";
          on-scroll-up = "pactl set-sink-volume @DEFAULT_SINK@ +5%";
          on-scroll-down = "pactl set-sink-volume @DEFAULT_SINK@ -5%";
          smooth-scrolling-threshold = 1;
        };
        "pulseaudio#mic" = {
          format = "{format_source}";
          format-source = "";
          format-source-muted = "";
          tooltip-format = "{volume}% {format_source} ";
          on-click = "pactl set-source-mute 0 toggle";
          on-scroll-down = "pactl set-source-volume 0 -1%";
          on-scroll-up = "pactl set-source-volume 0 +1%";
        };
        "pulseaudio/slider" = {
          min = 0;
          max = 140;
          orientation = "vertical";
        };
        network = {
          format = "{icon}";
          format-icons = {
            wifi = [ "󰤨" ];
            ethernet = [ "󰈀" ];
            disconnected = [ "󰖪" ];
          };
          format-wifi = "󰤨";
          format-ethernet = "󰈀";
          format-disconnected = "󰖪";
          format-linked = "󰈁";
          tooltip = false;
          on-click = "pgrep -x rofi &>/dev/null && notify-send rofi || networkmanager_dmenu";
        };
        "network#speed" = {
          format = " {bandwidthDownBits} ";
          rotate = 90;
          interval = 5;
          tooltip-format = "{ipaddr}";
          tooltip-format-wifi = "{essid} ({signalStrength}%)   \n{ipaddr} | {frequency} MHz{icon} ";
          tooltip-format-ethernet = "{ifname} 󰈀 \n{ipaddr} | {frequency} MHz{icon} ";
          tooltip-format-disconnected = "Not Connected to any type of Network";
          tooltip = true;
          on-click = "pgrep -x rofi &>/dev/null && notify-send rofi || networkmanager_dmenu";
        };
        bluetooth = {
          format-on = "";
          format-off = "󰂲";
          format-disabled = "";
          format-connected = "<b></b>";
          tooltip-format = "{controller_alias}\t{controller_address}\n\n{num_connections} connected";
          tooltip-format-connected = "{controller_alias}\t{controller_address}\n\n{num_connections} connected\n\n{device_enumerate}";
          tooltip-format-enumerate-connected = "{device_alias}\t{device_address}";
          tooltip-format-enumerate-connected-battery = "{device_alias}\t{device_address}\t{device_battery_percentage}%";
          on-click = "rofi-bluetooth -config ~/.config/rofi/menu.d/network.rasi -i";
        };
        "bluetooth#status" = {
          format-on = "";
          format-off = "";
          format-disabled = "";
          format-connected = "<b>{num_connections}</b>";
          format-connected-battery = "<small><b>{device_battery_percentage}%</b></small>";
          tooltip-format = "{controller_alias}\t{controller_address}\n\n{num_connections} connected";
          tooltip-format-connected = "{controller_alias}\t{controller_address}\n\n{num_connections} connected\n\n{device_enumerate}";
          tooltip-format-enumerate-connected = "{device_alias}\t{device_address}";
          tooltip-format-enumerate-connected-battery = "{device_alias}\t{device_address}\t{device_battery_percentage}%";
          on-click = "rofi-bluetooth -config ~/.config/rofi/menu.d/network.rasi -i";
        };
        battery = {
          rotate = 270;
          states = {
            good = 95;
            warning = 30;
            critical = 15;
          };
          format = "{icon}";
          format-charging = "<b>{icon} </b>";
          format-full = "<span color='#82A55F'><b>{icon}</b></span>";
          format-icons = [
            "󰁻"
            "󰁼"
            "󰁾"
            "󰂀"
            "󰂂"
            "󰁹"
          ];
          tooltip-format = "{timeTo} {capacity} % | {power} W";
        };
        clock = {
          format = "{:%H\n%M}";
          tooltip-format = "<tt><small>{calendar}</small></tt>";
          calendar = {
            mode = "month";
            mode-mon-col = 3;
            weeks-pos = "right";
            on-scroll = 1;
            on-click-right = "mode";
            format = {
              today = "<span color='#a6e3a1'><b><u>{}</u></b></span>";
            };
          };
        };
        "power-profiles-daemon" = {
          format = "{icon}";
          tooltip-format = "Power profile: {profile}\nDriver: {driver}";
          tooltip = true;
          format-icons = {
            default = "";
            performance = "<span color='#B37F34'><small></small></span>";
            balanced = "<span><small> </small></span>";
            "power-saver" = "<span color='#a6e3a1'><small></small></span>";
          };
        };
        "custom/hyprshade" = {
          format = "{}";
          tooltip = true;
          signal = 11;
          exec = "toggle-hyprshade status";
          on-click = "toggle-hyprshade";
          return-type = "json";
        };
        "custom/weather" = {
          format = "{}";
          tooltip = true;
          interval = 3600;
          # You may need to install wttrbar via nixpkgs
          exec = "${pkgs.wttrbar}/bin/wttrbar --custom-indicator '{ICON}\n<b>{temp_C}</b>' --location noida";
          return-type = "json";
        };
        "custom/updates" = {
          format = "{}";
          interval = 10800;
          exec = "${config.home.homeDirectory}/.config/waybar/bin/updatecheck";
          return-type = "json";
          exec-if = "exit 0";
          signal = 8;
        };
        "custom/vpn" = {
          format = "{} ";
          exec = "${config.home.homeDirectory}/.config/waybar/bin/vpn";
          return-type = "json";
          interval = 5;
        };
        "custom/hotspot" = {
          format = "{} ";
          exec = "${config.home.homeDirectory}/.config/waybar/bin/hotspot";
          return-type = "json";
          on-click = "hash wihotspot && wihotspot";
          interval = 5;
        };
        "custom/mark" = {
          format = "";
          tooltip = false;
        };
        "custom/colorpicker" = {
          format = "{}";
          return-type = "json";
          interval = "once";
          exec = "colorpicker -j";
          on-click = "sleep 1 && colorpicker";
          signal = 1;
        };
        "custom/hyprkill" = {
          format = "{}";
          interval = "once";
          exec = "echo '󰅙\nKill clients using hyrpctl kill'";
          on-click = "sleep 1 && hyprctl kill";
        };
        "custom/notifications" = {
          format = "<b>{}</b> ";
          exec = "noti-cycle -j";
          on-click = "noti-cycle";
          on-click-right = "noti-cycle rofi";
          return-type = "json";
          interval = "once";
          signal = 2;
        };
        idle_inhibitor = {
          format = "{icon}";
          tooltip-format-activated = "Idle Inhibitor is active";
          tooltip-format-deactivated = "Idle Inhibitor is not active";
          format-icons = {
            activated = "󰔡";
            deactivated = "󰔢";
          };
        };
      };
    };
    programs.waybar.style = ./style.css;
  };
}
