{
  pkgs,
  config,
  lib,
  ...
}: {
  home.packages = with pkgs; [
    vlc # Video player
    pinta # Image editor
    onlyoffice-desktopeditors # Office suite
    blanket # Listen to different sounds

    # Backup
    thunar
    gnome-text-editor
  ];

  home.persistence."/persist" = lib.mkIf (config.var.impermanenceEnabled or false) {
    directories = [
    ];
  };
}
