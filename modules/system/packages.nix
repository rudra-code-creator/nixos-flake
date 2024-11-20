# New module for SYSTEM-WIDE packages and allowUnfree
{ config, pkgs, ... }: {
  nixpkgs.config.allowUnfree = true;
  environment.systemPackages = with pkgs; [
    # Basics:
    alacritty # terminal
    chromium # browser
    xed-editor # text editor
    rofi # app launcher
    dmenu # launcher
    micro # terminal text editor
    neofetch
    git
    eza

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