# systemd type operations
{ config, lib, pkgs, ... }: {
  nixpkgs.config.allowUnfree = true;


  # List services that you want to enable:
  services = {
    # udev.packages = [ pkgs.platformio ];

    xserver = {
      enable = true;
      xkb.layout = "gb";

      displayManager = {
        gdm = {
          enable = false;
          wayland = true;
        };
      };
      
      desktopManager = {
        gnome.enable = true;
        xterm.enable = false;
      };

      videoDrivers = [ "nvidia" ];

      excludePackages = with pkgs; [ xterm ];
    };

    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
    };

    greetd = {
      enable = true;
      settings = rec {
        initial_session = {
          command = "${pkgs.hyprland}/bin/Hyprland";
        };
        default_session = initial_session;
      };
    };

    # databases
    postgresql = { enable = true; };

    # llms
    ollama = {
      enable = true;
      acceleration = "cuda";
    };
  };
}
