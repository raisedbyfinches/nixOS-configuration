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
        extraGroups = [ "wheel" "audio" ];
        packages = with pkgs; [
          # generic
          libvterm
          pamixer
          killall
          starship
          eza
          socat
          stylelint
          just
          fasd

          # janet for scripting
          janet
          jpm

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
          kitty
          paper-icon-theme
          vanilla-dmz

	  # tree sitter grammars
          tree-sitter-grammars.tree-sitter-janet-simple

          # haskell packages
          haskellPackages.stylish-haskell
          haskellPackages.pandoc
          haskellPackages.hoogle
          ghcid
          treefmt

	  # LLM testing stuff
          nodejs
          copilot-language-server-fhs

          # LSPs and linters
          shellcheck
          irony-server

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
