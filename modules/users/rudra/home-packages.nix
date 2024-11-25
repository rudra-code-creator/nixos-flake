{
  # config,
  pkgs,
  # lib,
  ...
}:

{
  # Packages that should be installed to the user profile.
  home.packages = with pkgs; [

    # Testing
    kmonad # keybaord

    sassc
    gtk-engine-murrine
    gnome-themes-extra

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
    zellij
    cowsay
    fortune

    # Productivity:
    autokey
    flameshot
    fsearch
    gpick # Colorpicker x11
    eyedropper
    piper-tts
    scrcpy # Screen Record
    tree # directory structure hierarchies
    joplin-desktop # Notes
    bazecor
    github-desktop
    waynergy

    # Self Hosting:
    docker-compose
    cloudflared
    rustdesk-flutter

    # Programming:
    android-tools
    neovim
    #neovim-unwrapped
    vscodium # Text Editor
    ghz # gRPC benchmarking and load testing
    ghc # Glasgow Haskell compiler
    # ghdl # VHDL 2008/93/87 simulator
    ghdl-llvm # VHDL 2008/93/87 simulator
    ghcid # GHCi based bare bones IDE
    ghciwatch # Ghci-based file watching recompiler for Haskell development
    gh-ost # Triggerless online schema migration solution for MySQL
    ghosttohugo
    ghostscript

    #HACKING
    ghunt
    ghost
    ghostunnel
    ghidra
    ghauri

    #github
    gh
    ghr
    ghq
    ghorg
    gh-s
    gh-f
    gh-poi
    gh2md
    gh-eco
    gh-cal
    ghfetch
    gh-dash
    gh-notify
    gh-copilot
    gh-screensaver
    gh-actions-cache
    gh-markdown-preview

    ghp-import
    ghdorker
    ghrepo-stats


    ghostie # Github notifications


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
    figlet # ASVII Generator
    glava
    glow
    neofetch
    hello

    # Other
    ferdium
    gparted
    gthumb # Pic Viewer
    gtk4
    jumpapp
    localsend
    lsof
    megacmd
    playerctl
    polybarFull
    protonvpn-gui
    scrot # Screenshot
    starship
    syncthing
    tmux
    wine
    xarchiver
    xclip
    xdotool
    xvfb-run
    yt-dlp
    zenity # Prompt for new Files

    # fonts
    font-awesome
    nerdfonts
    unifont

    # Soulseek
    nicotine-plus
    slskd

    # Messaging
    discord
    telegram-desktop
    element-desktop

    # Jellyfin Programs
    #jellyfin
    #jellyfin-ffmpeg
    #jellyfin-web
  ];

}
