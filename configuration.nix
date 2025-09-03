# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

{ config, lib, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Hostname
  networking.hostName = "nixos";

  # Networking  
  networking.networkmanager.enable = true;

  # Timezone
  time.timeZone = "America/Bahia";

  # internationalisation poperties
  i18n.defaultLocale = "pt_BR.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "pt_BR.UTF-8";
    LC_IDENTIFICATION = "pt_BR.UTF-8";
    LC_MEASUREMENT = "pt_BR.UTF-8";
    LC_MONETARY = "pt_BR.UTF-8";
    LC_NAME = "pt_BR.UTF-8";
    LC_NUMERIC = "pt_BR.UTF-8";
    LC_PAPER = "pt_BR.UTF-8";
    LC_TELEPHONE = "pt_BR.UTF-8";
    LC_TIME = "pt_BR.UTF-8";
  };

  # Keysmaps in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "intl";
  };

  # Console keymap
  console.keyMap = "us-acentos";

  # Display Manager
  services.displayManager.sddm.enable = true;

  # X11 windowing system
  services.xserver.enable = true;
  
  # Nvidia and Drivers
  boot.kernelParams = [ "nvidia-drm.modeset=1" ];

  services.xserver.videoDrivers = [ "nvidia" ];
  hardware.graphics.enable = true;
  hardware.graphics.enable32Bit = true;
  hardware.nvidia.modesetting.enable = true;
  hardware.nvidia.open = false; # Enable nvidia proprietary

  # Fonts
  fonts = {
  enableDefaultPackages = true;
  packages = with pkgs; [
   nerd-fonts.jetbrains-mono
   ];
  };
 
  # Sound with pipewire
  services.pulseaudio.enable = false;
  services.pipewire = {
    enable = true;
    pulse.enable = true;
    alsa.support32Bit = true;
  };
  security.rtkit.enable = true;

  # Environment sessions variables
  environment.sessionVariables = {
   XCURSOR_SIZE = "24";
   XCURSOR_THEME = "Bibata-Modern-Classic";
   NIXOS_OZONE_WL = "1";
   WLR_NO_HARDWARE_CURSORS = "1";
  };

  environment.extraSetup = ''
    rm -f $out/share/applications/cups.desktop
  '';

  # Enables databases and services
  services.postgresql = {
    enable = true;
    package = pkgs.postgresql;

  };

  # User account. Dont forget to set a password with 'passwd'.
  users.users.wel = {
    isNormalUser = true;
    description = "Welisson";
    extraGroups = [ "networkmanager" "wheel" "video" "render" "audio" "storage" "input" "kvm" "docker" ];
    shell = pkgs.zsh;
    packages = with pkgs; [];
   };

  # Enable hyprland
  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };

  # XDG Portals
  xdg.portal.enable = true;
  xdg.portal.extraPortals = [
    pkgs.xdg-desktop-portal-hyprland
    pkgs.xdg-utils
    pkgs.xdg-user-dirs

  ];

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # Enable zsh
  programs.zsh.enable = true;

  # Enable udisks2
  services.udisks2.enable = true;

  environment.systemPackages = with pkgs; [

  # System Utilities
  networkmanagerapplet
  polkit
  polkit_gnome
  udisks
  gvfs
  procs
  gnutar
  unzip
  psmisc # utilitários gerais
  imagemagick

  # Media / Audio / Video
  mpv
  flameshot
  grim
  slurp
  wl-clipboard
  pamixer
  pavucontrol
  pulseaudio

  # Qt / GTK UI Tools
  kdePackages.qt6ct # Qt6ct
  libsForQt5.qt5ct # Qt5ct
  kdePackages.qtstyleplugin-kvantum # Kvantum

  # Applications
  firefox
  obsidian
  discord
  spotify
  obs-studio
  dbeaver-bin
  kdePackages.dolphin
  xfce.ristretto

  # Themes / Icons / Cursors
  arc-theme
  catppuccin-gtk
  materia-theme
  graphite-gtk-theme
  gruvbox-gtk-theme
  papirus-icon-theme
  tela-circle-icon-theme
  gruvbox-plus-icons
  bibata-cursors

  # Wayland / Hyprland Utilities
  hyprland
  hypridle
  waybar
  rofi-wayland
  nwg-look
  wlogout
  swww

  # IDEs / Editors
  vscode
  jetbrains.idea-community-bin
  neovim

  # Terminal / Cli
  kitty
  fastfetch
  cmatrix
  cava
  btop
  wget
  curl

  # Dev / Programming
  jdk #OpenJdk 21
  python311
  gcc # C/C++
  gdb # Debugger
  git
  
  ];

  # Exclude packages or disable
  services.xserver.excludePackages = [ pkgs.xterm ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # Copy the NixOS configuration file and link it from the resulting system
  # (/run/current-system/configuration.nix). This is useful in case you
  # accidentally delete configuration.nix.
  # system.copySystemConfiguration = true;

  # This option defines the first version of NixOS you have installed on this particular machine,
  # and is used to maintain compatibility with application data (e.g. databases) created on older NixOS versions.
  #
  # Most users should NEVER change this value after the initial install, for any reason,
  # even if you've upgraded your system to a new NixOS release.
  #
  # This value does NOT affect the Nixpkgs version your packages and OS are pulled from,
  # so changing it will NOT upgrade your system - see https://nixos.org/manual/nixos/stable/#sec-upgrading for how
  # to actually do that.
  #
  # This value being lower than the current NixOS release does NOT mean your system is
  # out of date, out of support, or vulnerable.
  #
  # Do NOT change this value unless you have manually inspected all the changes it would make to your configuration,
  # and migrated your data accordingly.
  #
  # For more information, see `man configuration.nix` or https://nixos.org/manual/nixos/stable/options#opt-system.stateVersion .
  system.stateVersion = "25.05"; # Did you read the comment?

}

