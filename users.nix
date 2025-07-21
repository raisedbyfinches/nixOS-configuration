# user configuration
{ config, lib, pkgs, ... }:

{
  users = {
    users = {
      g = {
        isNormalUser = true;
        description = "G";
        createHome = true;
        home = "/home/g";
        extraGroups = [ "wheel" "audio" "transmission" "plex" "dialout" ];
        packages = with pkgs; [
          # generic
          libvterm
          pamixer
          killall
          starship
          eza
          socat

          # glitz
          cliphist
          pyprland
          hypridle
          hyprlock
          hyprpicker
          hyprnotify
          hyprpaper
          hyprshot
          hyprsunset
          hyprpolkitagent
          grimblast
          hyprland-protocols
          hyprpolkitagent
          bemenu
          eww
          wmctrl
          wl-clipboard-rs
          wlogout
          swappy
          wireplumber
          swww
          playerctl
          xdg-desktop-portal-hyprland
          nwg-drawer
          nwg-look
          nwg-wrapper

          # haskell packages
          haskellPackages.stylish-haskell
          haskellPackages.pandoc
          haskellPackages.hoogle
          ghcid
          treefmt

          # LSPs and linters
          shellcheck
          irony-server

          # copilot and other assistants
          copilot-language-server-fhs
          nodejs # for copilot-server-install

          # maths libraries
          arpack
          gnuplot
          openblas
 
          # office
          pom
          gnome-pomodoro
          tty-clock
        ];
        shell = pkgs.zsh;
        uid = 1000;
      };
    };
  };
}
