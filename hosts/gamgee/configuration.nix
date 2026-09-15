{config, ...}: {
  imports = [
    # Mostly system related configuration
    ../../nixos/amd-graphics.nix
    ../../nixos/audio.nix
    ../../nixos/bluetooth.nix
    ../../nixos/fonts.nix
    ../../nixos/home-manager.nix
    ../../nixos/llama-cpp.nix
    ../../nixos/nix.nix
    ../../nixos/ssh.nix
    ../../nixos/systemd-boot.nix
    ../../nixos/tmux.nix
    ../../nixos/tuigreet.nix
    ../../nixos/autologin.nix # Skip first TUIGreet login, use LUKS password to unlock the keyring
    ../../nixos/users.nix
    ../../nixos/utils.nix
    ../../nixos/hyprland.nix
    ../../nixos/steam.nix
    ../../nixos/kernel-hardening.nix
    ../../server-modules/arr.nix
    ../../home/programs/gui/helium/system.nix # I hate browser's configuration..

    # CHANGEME: You should probably remove those things:
    # ./wireguard.nix
    # ./persistence.nix # impermanence: what to keep once "/" is wiped on boot
    # ./usbguard.nix
    # ./disko.nix
    # ./secrets

    # You should let those lines as is
    ./hardware-configuration.nix
    ./variables.nix
  ];

  home-manager.users."${config.var.username}" = import ./home.nix;

  users.users.${config.var.username}.hashedPassword = "$6$MX2I7C5gx9uH7X4m$ujXuybaY6IWChL3ecKXUhH.9TJs/xCXa7ePBGWc0slt5.oOnVqPnaz.YEmmuWJPRx0ITArYOUZAstafTJZv/e1";
  # Don't touch this
  system.stateVersion = "26.05";
}
