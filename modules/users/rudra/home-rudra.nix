{ config, pkgs, ... }:

{
  imports = [
    ../rudra/bashrc.nix
    ../rudra/home-packages.nix
    #...other imports
  ];

  # TODO please change the username & home directory to your own
  home.username = "rudra";
  home.homeDirectory = "/home/rudra";

  # link the configuration file in current directory to the specified location in home directory
  # home.file.".config/i3/wallpaper.jpg".source = ./wallpaper.jpg;

  # link all files in `./scripts` to `~/.config/i3/scripts`
  # home.file.".config/i3/scripts" = {
  #   source = ./scripts;
  #   recursive = true;   # link recursively
  #   executable = true;  # make all files executable
  # };

  # encode the file content in nix configuration file directly
  # home.file.".xxx".text = ''
  #     xxx
  # '';
  
  # Set environment variables
  home.sessionVariables = {
    EDITOR = "micro";
    PATH = "$PATH:/usr/bin:$HOME/.local/bin:$HOME/rudra-app-repo/";
  };

  # Set cursor size and dpi for 4k monitor
  xresources.properties = {
    "Xcursor.size" = 22;
    # "Xft.dpi" = 172;
  };

  # basic configuration of programs, please change to your own:
  #Git
  programs.bat = {
    enable = true;
    config = {
      theme = "GitHub";
      italic-text = "always";
    };    
  };
  
  programs.git = {
    enable = true;
    userName = "rudra-code-creator";
    userEmail = "rudrakeshwani2@gmail.com";
  };

  programs.bash.enable = true;
  programs.bash.shellAliases = {
    
    # Nixos commands
    rebuild = "sudo nixos-rebuild switch";
    cdmodules = "cd $HOME/nixos-config/modules";
    cdnix = "cd $HOME/nixos-config";
    config = "micro $HOME/nixos-config/configuration.nix";
    nixgarbage = "sudo nix-store --gc";

    # APP LAUNCH
    timeshift = "sudo timeshift-gtk";
    gparted = "sudo gparted";
    vmm = "virt-manager";
    gufw = "sudo gufw";
    ufw = "sudo ufw";
    
    # FILE LOCATIONS
    dow = "cd $HOME/Downloads";
    hom = "cd ~/";

    # QUICK TERMS
    ll = "ls -l";
    cl = "clear";
    CL = "clear";
    xx = "find . -type f \\( -name \"*.sh\" -o -name \"*.py\" -o -name \"*.perl\"       -o -name \"*.AppImage\" \\) -exec chmod +x {} +";
    cron = "crontab -e";
    cronjob20 = "sudo journalctl -u cron -n 20";
    cronjob40 = "sudo journalctl -u cron -n 40";
    cronjob50 = "sudo journalctl -u cron -n 50";
    back = "cd ../";
    back2 = "cd ../..";
    back3 = "cd ../../..";
    mega = "mega-sync";
    makes = "makepkg -si";
    uninstall = "flatpak uninstall";
    samba = "sudo micro /etc/samba/smb.conf";
    dup = "sudo docker-compose up -d";
    pup = "sudo podman-compose up -d";
    source = "source ~/.bashrc";
    SOURCE = "source ~/.bashrc";
    trash = "trash-empty";
    w = "wget";  
    ireload = "i3-msg reload";
    sreload = "swaymsg reload";
    scr = "bash $HOME/.scripts/scrcp.sh";
    apacherestart = "sudo systemctl restart apache2";

  };

  programs.bash.initExtra = ''
    # Chain of sourcing:
    # .xprofile -> .profile -> .bashrc
    # source ~/.bashrc

    # If not running interactively, don't do anything
    case $- in
        *i*) ;;
          *) return;;
    esac

    # QT apps theming
    export QT_QPA_PLATFORMTHEME="qt5ct"

    # Share history between shells
    export PROMPT_COMMAND='history -a'

    # Starship prompt
    if command -v starship &> /dev/null; then
        eval "$(starship init bash)"
    fi

    # History control
    export HISTCONTROL=ignoredups:erasedups
    shopt -s histappend
    PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"

    # Enable bash completion
    if ! shopt -oq posix; then
      if [ -f /usr/share/bash-completion/bash_completion ]; then
        . /usr/share/bash-completion/bash_completion
      elif [ -f /etc/bash_completion ]; then
        . /etc/bash_completion
      fi
    fi

    # Nix LD for bin files
    export NIX_LD=$(cat $(nix eval --raw nixpkgs#stdenv.cc)/nix-support/dynamic-linker)
  '';

  # This value determines the home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update home Manager without changing this value. See
  # the home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "24.05";

  # Let home Manager install and manage itself.
  programs.home-manager.enable = true;

  # home.enableNixpkgsReleaseCheck = false;
}