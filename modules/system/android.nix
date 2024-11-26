{ 
  # config, 
  pkgs, 
  ... 
}:

{
  # Enable sound with pipewire
  programs.adb.enable = true;

  services.udev.packages = [
    pkgs.android-udev-rules
  ];
}
