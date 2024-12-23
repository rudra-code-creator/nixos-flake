{
  description = "NixOS configuration with system-wide packages and allowUnfree";

  inputs = {
    #nixpkgs.url = "github:nixos/nixpkgs/nixos-24.05";
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      #url = "github:nix-community/home-manager/release-24.05";
      url = "github:nix-community/home-manager/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-colors.url = "github:misterio77/nix-colors";

  };

  outputs =
    {
      self,
      nixpkgs,
      home-manager,
      nix-colors,
      ...
    }@inputs:
    {
      nixosConfigurations = {
        nixos = nixpkgs.lib.nixosSystem {

          specialArgs = { inherit inputs; };
          system = "x86_64-linux";

          modules = [

            # ./nix.nix
            # Window Managers & Desktop Environments
            ./modules/desktop/wm/x11/i3.nix
            ./modules/desktop/wm/wayland/hyprland.nix
            #./modules/desktop/wm/x11/dwm/dwm.nix
            ./modules/desktop/de/gnome.nix
            ./modules/desktop/de/cinnamon.nix

            # Configs
            ./modules/system/configuration.nix
            ./modules/system/hardware-configuration.nix

            # Home Manager
            home-manager.nixosModules.home-manager
            {
              # extraSpecialArgs = { inherit inputs; };
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.backupFileExtension = "backup";
              home-manager.users = {
                rudra = import ./modules/users/rudra/home-rudra.nix;
                #rudratwo = import ./modules/users/rudratwo/home-rudratwo.nix;
              };
            }

            (
              {
                # config,
                pkgs,
                # lib,
                ...
              }:
              {
                environment.systemPackages = with pkgs; [
                  nil
                  nixfmt-rfc-style
                  nix-index
                  nix-prefetch-git
                  nix-melt

                  flake-checker # Flake health checker
                  autoflake #Tool to remove unused imports and unused variables
                  deploy-rs
                  fh

                ];

                nix = let
                  users = ["root" "rudra"];
                in {
                  settings =
                    {
                      experimental-features = "nix-command flakes";
                      http-connections = 50;
                      warn-dirty = false;
                      log-lines = 50;
                      sandbox = "relaxed";
                      auto-optimise-store = true;
                      trusted-users = users;
                      allowed-users = users;
                    };
                    # // (lib.optionalAttrs config.apps.tools.direnv.enable {
                    #   keep-outputs = true;
                    #   keep-derivations = true;
                    # });
                  gc = {
                    automatic = true;
                    dates = "weekly";
                    options = "--delete-older-than 7d";
                  };
                  #for nixD
                  nixPath = [ "nixpkgs=${inputs.nixpkgs}" ];

                  # flake-utils-plus
                  # generateRegistryFromInputs = true;
                  # generateNixPathFromInputs = true;
                  # linkInputs = true;
                };
              }
            )
          ];
        };
      };
    };
}
