# systemd type operations
{ config, lib, pkgs, ... }: {
  nixpkgs.config.allowUnfree = true;

  # List services that you want to enable:
  services = {
    # udev.packages = [ pkgs.platformio ];

    # glitz
    xserver = {
      enable = true;
      xkb.layout = "gb";

      displayManager = {
        gdm = {
          enable = true;
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
      # If you want to use JACK applications, uncomment this
      #jack.enable = true;
    };

    # databases
    postgresql = { enable = true; };

    # llms
    #ollama = {
    #  enable = true;
    #  acceleration = "cuda";
    #};
  };
}
