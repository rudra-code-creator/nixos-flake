{ config, pkgs, ... }:

{
  # Packages that should be installed to the user profile.
  home.packages = with pkgs; [

    # Testing
    kmonad #keybaord

    # Web Browsers:
    brave
    firefox
    microsoft-edge
    opera
    vivaldi


    # File Managers & Addons:
    xfce.catfish
    mate.caja-with-extensions
    ranger
    fzf

    # Music:
    clementine
    sayonara

    # Basics
    terminator # Konsole
    warp-terminal
    bitwarden # PW Manager
    wezterm
    tmux

    # Productivity:
    autokey
    flameshot
    fsearch
    gpick # Colorpicker x11
    eyedropper
    piper-tts
    scrcpy # Screen Record
    tree # directory structure hierarchies 
    #joplin-desktop # Notes
    bazecor
    github-desktop
    waynergy

    # Self Hosting:
    docker-compose
    #cloudflared
    #rustdesk-flutter

    # Programming:
    android-tools
    neovim
    #neovim-unwrapped
    vscodium # Text Editor

    #shell
    zoxide
    carapace
    atuin
    #nushell

    # Editing:
    audacity
    gimp-with-plugins
    obs-studio 

    # Virtual:
    distrobox
    virt-manager

    # TUI:
    bottom
    # cava
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