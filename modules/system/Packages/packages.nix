# New module for SYSTEM-WIDE packages and allowUnfree
{
  # config,
  pkgs,
  # lib,
  ...
}:
{
  nixpkgs.config.allowUnfree = true;
  # nixpkgs.config.allowUnsupportedSystem = true;
  environment.systemPackages = with pkgs; [
    # Basics:
    alacritty # terminal
    kitty
    wezterm
    chromium # browser
    xed-editor # text editor
    rofi # app launcher
    dmenu # launcher
    micro # terminal text editor
    neofetch
    git
    eza
    sl
    waynergy
    gnome-extension-manager

    licensor

    # Nix Utils
    nix-index
    nix-init
    nix-melt
    nix-update
    nixpkgs-fmt
    nixpkgs-hammering
    nixpkgs-review
    nurl

    # NIX CODE FORMATTERS
    nixfmt-rfc-style # my favourite - new official style for nixpkgs
    nixpkgs-fmt # ugly AF but current official style for nixpkgs
    alejandra # fast and reliable, readable style

    nixd # NIX LSP

    fish
    nushell

    #zsh
    zsh
    zsh-z
    zsh-bd
    zsh-edit

    # File Manager:
    xfce.thunar
    xfce.thunar-archive-plugin

    # Others:
    bash
    folder-color-switcher
    cups
    distrobox
    gpick
    haskellPackages.greenclip
    home-manager
    networkmanagerapplet
    pyload-ng
    trash-cli
    unzip
    vlc
    wget
    xarchiver
    xorg.xmodmap
    xorg.setxkbmap

    # Audio
    pulseaudio
    pamixer
    pavucontrol

    # Trackpad 
    libinput
    libinput-gestures
    libnotify
    libimobiledevice
    ifuse

    # Script Dependencies
    coreutils
    ffmpeg_7
    findutils
    gawk
    moreutils
    perl
    rclone
    rename
    rsync
    jq
    neovim

    # for compiling
    gcc
    gnumake
    xorg.libxcb

    # Windows Manager
    xorg.xinit

    # xdm build
    jdk
    maven
  ];
}
