{ config, pkgs, ... }:

{
  # Packages that should be installed to the user profile.
  home.packages = with pkgs; [

    # Testing
    kmonad #keybaord

    # Web Browsers:
    brave
    firefox
    #microsoft-edge
    opera

    # File Managers & Addons:
    xfce.catfish
    mate.caja-with-extensions
    ranger

    # Music:
    clementine
    sayonara

    # Basics
    terminator # Konsole
    bitwarden # PW Manager

    # Productivity:
    autokey
    colorpicker # waylad
    flameshot
    fsearch
    gpick # Colorpicker x11
    piper-tts
    normcap # OCR
    scrcpy # Screen Record
    tree # directory structure hierarchies 
    #joplin-desktop # Notes

    # Self Hosting:
    docker-compose
    #cloudflared
    #rustdesk-flutter

    # Programming:
    android-tools
    neovim
    #neovim-unwrapped
    vscodium # Text Editor

    # Editing:
    audacity
    gimp-with-plugins
    obs-studio 

    # Virtual:
    distrobox
    virt-manager

    # TUI:
    bottom
    cava
    cmatrix
    fastfetch
    figlet #ASVII Generator
    glava
    glow
    neofetch

    # Other
    #ferdium
    gparted
    gthumb #Pic Viewer
    gtk4
    jumpapp
    localsend
    lsof
    megacmd
    playerctl 
    polybarFull
    protonvpn-gui      
    scrot #Screenshot
    starship
    syncthing
    tmux
    wine
    xarchiver
    xclip
    xdotool
    xvfb-run
    yt-dlp
    zenity #Prompt for new Files

    # fonts
    font-awesome
    nerdfonts
    unifont

    # Soulseek
    nicotine-plus
    slskd

    # Messaging
    #discord
    #telegram-desktop
    #element-desktop

    # Jellyfin Programs
    #jellyfin
    #jellyfin-ffmpeg
    #jellyfin-web
  ];

}