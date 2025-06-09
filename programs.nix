# software choices
{ config, pkgs, ... }: {
  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    # basics
    bat
    binutils
    curl
    coreutils
    dfc
    direnv
    editorconfig-core-c
    jansson
    jq
    git
    gnupg
    imagemagick
    nix-index
    zsh
    zsh-autosuggestions
    zsh-command-time
    zsh-completions
    zlib
    p7zip
    unzip
    fd
    pass
    openssl
    ripgrep
    trash-cli
    shfmt
    cmake
    libtool
    bc

    # dev
    devenv
    emacs
    gcc
    gnumake
    clang
    vim
    ccls
    tidyp 
    stylelint
    just

    # glitz
    kitty
    paper-icon-theme
    vanilla-dmz

    # haskell
    ghc
    cabal-install
    hlint
    haskell-language-server
    haskellPackages.fourmolu
    pandoc

    # media
    ffmpeg
    spotify

    # games
    # heroic
    discord
    # OR discord-canary

    # web office
    wordnet
    languagetool
    firefox
    thunderbird
    texlive.combined.scheme-medium
    texlivePackages.archivo # font
    poppler
    groff
    ghostscript
    graphviz 
    (aspellWithDicts (dicts: with dicts; [ en en-computers en-science ]))
  ];

  xdg.portal = {
      enable = true;
      extraPortals = with pkgs; [
          xdg-desktop-portal-hyprland
      ];
  };

  programs = {
    zsh.enable = true;
    waybar.enable = true;
    # steam.enable = true;
    hyprland = {
      enable = true;
      xwayland.enable = true;
    };
  };

  fonts = {
    enableGhostscriptFonts = true;
    packages = with pkgs; [ 
      font-awesome 
      source-sans-pro
      noto-fonts
      noto-fonts-cjk-sans
      noto-fonts-color-emoji
      noto-fonts-emoji
      noto-fonts-extra
      iosevka
      hasklig
      victor-mono
      nerd-fonts.arimo
    ];

    fontconfig = {
      defaultFonts = {
        monospace =
          [ "JetBrains Mono" "Iosevka" "Hasklig" ];
        sansSerif = [ "Noto Sans" ];
        serif = [ "Noto Sans" ];
      };
    };
  };
}

