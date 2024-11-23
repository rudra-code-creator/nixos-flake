{
  # config,
  pkgs,
  # inputs,
  ...
}:

{
  imports = [
    ../rudra/home-packages.nix
    ../rudra/nushell.nix
    # ../rudra/theming.nix

  ];

  # TODO please change the username & home directory to your own
  home.username = "rudra";
  home.homeDirectory = "/home/rudra";

  dconf = {
    enable = true;

    settings."org/gnome/shell" = {
      disable-user-extensions = false;
      enabled-extensions = with pkgs.gnomeExtensions; [
        add-username-to-top-panel.extensionUuid
        blur-my-shell.extensionUuid
        gsconnect.extensionUuid
        workspaces-indicator-by-open-apps.extensionUuid
        dash-to-dock.extensionUuid
      ];
    };

    settings."org/gnome/desktop/interface".color-scheme = "prefer-dark";
  };

  # link the configuration file in current directory to the specified location in home directory
  # home.file.".config/i3/wallpaper.jpg".source = ./wallpaper.jpg;

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    ".zshrc".source = ./dotfiles-rudra/zshrc/.zshrc;
    # ".config/wezterm".source = ./dotfiles-rudra/wezterm;
    ".config/starship".source = ./dotfiles-rudra/starship;
    ".config/zellij".source = ./dotfiles-rudra/zellij;
    ".config/nvim".source = ./dotfiles-rudra/nvim;

    # ".config/nushell/config.nu".source = ./dotfiles-rudra/nushell/config.nu;
    # ".config/nushell/env.nu".source = ./dotfiles-rudra/nushell/env.nu;

    # ".config/nix".source = ./dotfiles-rudra/nix;
    # ".config/nix-darwin".source = ./dotfiles-rudra/nix-darwin;
    ".config/tmux".source = ./dotfiles-rudra/tmux;
    ".config/ghostty".source = ./dotfiles-rudra/ghostty;
  };

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
    # PATH = "$PATH:/usr/bin:$HOME/.local/bin:$HOME/rudra-app-repo/";
  };

  home.sessionPath = [
    # no need for a bare $PATH item; these are all appended to any base
    # PATH you already have
    # and /usr/bin isn't a thing on NixOS (all it should ever contain is
    # `env`, as a concession to shell scripts that haven't been fixup-ed
    # by a Nix derivation)
    "$HOME/.local/bin"
    "$HOME/rudra-app-repo"
  ];

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
      theme = "github";
      italic-text = "always";
    };
  };

  programs.git = {
    enable = true;
    userName = "rudra-code-creator";
    userEmail = "rudrakeshwani2@gmail.com";
  };

  programs.bash.enable = true;
  programs.zsh.enable = true;
  programs.fish.enable = true;
  programs.nushell.enable = true;

  programs.carapace = {
    enable = true;
    enableBashIntegration = true;
    enableZshIntegration = true;
    enableFishIntegration = true;
    enableNushellIntegration = true;
  };

  programs.starship = {
    enable = true;
    enableBashIntegration = true;
    enableZshIntegration = true;
    enableFishIntegration = true;
    enableNushellIntegration = true;
    enableIonIntegration = true;
  };

  programs.atuin = {
    enable = true;
    enableBashIntegration = true;
    enableZshIntegration = true;
    enableFishIntegration = true;
    enableNushellIntegration = true;
  };

  programs.broot = {
    enable = true;
    enableBashIntegration = true;
    enableZshIntegration = true;
    enableFishIntegration = true;
    enableNushellIntegration = true;
  };

  programs.direnv = {
    enable = true;
    enableBashIntegration = true;
    enableZshIntegration = true;
    # enableFishIntegration = true; #NIX COMPILER DOES NOOT LIKE FOR SOME REASON
    enableNushellIntegration = true;
    nix-direnv.enable = true;

    package = pkgs.direnv;
    nix-direnv.package = pkgs.nix-direnv;
  };

  programs.eza = {
    enable = true;
    enableBashIntegration = true;
    enableZshIntegration = true;
    enableFishIntegration = true;
    enableNushellIntegration = true;
    enableIonIntegration = true;
    extraOptions = [
      "--group-directories-first"
      "--header"
    ];
  };

  #TODO: Investigate keychain. looks like interesting tool
  programs.keychain = {
    enable = true;
    enableBashIntegration = true;
    enableZshIntegration = true;
    enableFishIntegration = true;
    enableNushellIntegration = true;
    enableXsessionIntegration = true;

  };

  programs.thefuck = {
    enable = true;
    enableBashIntegration = true;
    enableZshIntegration = true;
    enableFishIntegration = true;
    enableNushellIntegration = true;
  };

  programs.yazi = {
    enable = true;
    enableBashIntegration = true;
    enableZshIntegration = true;
    enableFishIntegration = true;
    enableNushellIntegration = true;
  };

  programs.zoxide = {
    enable = true;
    enableBashIntegration = true;
    enableZshIntegration = true;
    enableFishIntegration = true;
    enableNushellIntegration = true;
  };

  services.gpg-agent = {
    enable = true;
    enableBashIntegration = true;
    enableZshIntegration = true;
    enableFishIntegration = true;
    enableNushellIntegration = true;
    enableExtraSocket = true;
    enableScDaemon = true;
  };

  # This value determines the home Manager release that yours
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
