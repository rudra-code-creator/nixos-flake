{
  # config,
  pkgs,
  # libs,
  ...
}:

{
  environment.systemPackages = with pkgs.gnomeExtensions; [
    dash-to-dock
  ];
}
