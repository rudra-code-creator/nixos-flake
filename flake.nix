
{
  description = "NixOS configuration with system-wide packages and allowUnfree";

  inputs = {
    #nixpkgs.url = "github:nixos/nixpkgs/nixos-24.05";
    #dfsddffgfgdgfgdgdgdgdgdgdg
   nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      #url = "github:nix-community/home-manager/release-24.05";
      url = "github:nix-community/home-manager/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs@{ self, nixpkgs, home-manager, ... }: {
    nixosConfigurations = {
      nixos = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";

        users.users.rudra = {
          shell = pkgs.nushell;
        };

        modules = [
          # Window Managers & Desktop Environments
          ./modules/desktop/wm/x11/i3.nix
          #./modules/desktop/de/wayland/hyprland.nix
          #./modules/desktop/wm/x11/dwm/dwm.nix
          #./modules/desktop/de/wayland/gnome.nix
          ./modules/desktop/de/x11/cinnamon.nix

          # Configs
          ./modules/system/configuration.nix
          ./modules/system/hardware-configuration.nix

          # Home Manager
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users = {
                          rudra = import /home/rudra/nixos-config/modules/users/rudra/home-rudra.nix;
                          #rudratwo = import ./modules/users/rudratwo/home-rudratwo.nix;
                        };
          }
        ];
      };
    };
  };
}
