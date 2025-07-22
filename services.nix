# systemd type operations
{ config, lib, pkgs, ... }: {
  nixpkgs.config.allowUnfree = true;

  # List services that you want to enable:
  services = {

    displayManager = {
      gdm = {
        enable = true;
        wayland = true;
      };
    };
      
    desktopManager.gnome.enable = true;

    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
    };

    # databases
    postgresql = { enable = true; };
  };
}
