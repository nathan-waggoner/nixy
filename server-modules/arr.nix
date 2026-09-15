# *arr is a collection of media management applications.
# See https://github.com/rasmus-kirk/nixarr
# Setup guide: https://nixarr.com/wiki/setup/
{
  config,
  pkgs-unstable,
  ...
}: let
  username = config.var.username;
in {
  # Add my secrets
  # sops.secrets = {
  #   recyclarr = {
  #     owner = "recyclarr";
  #     # TODO: too permissive (world-writable), should be 0600/0400
  #     mode = "0777";
  #   };
  #   wireguard-pia = {
  #     group = "media";
  #     mode = "0600";
  #   };
  # };

  nixarr = {
    enable = true;

    mediaUsers = [username];
    mediaDir = "/mnt/storage/sdb/media";
    stateDir = "/mnt/storage/sdb/.state/nixarr";

    vpn = {
      enable = true;
      wgConf = "/mnt/storage/sdb/.secrets/wg.conf";
    };

    jellyfin = {
      enable = true;
      openFirewall = true;
    };

    transmission = {
      enable = true;
      peerPort = 50000;
      extraSettings = {
        trash-original-torrent-files = true;
        rpc-whitelist-enabled = false;
        rpc-host-whitelist-enabled = false;
      };
      vpn.enable = true;
    };
    # seerr = {
    #   enable = true;
    #   package = pkgs-unstable.seerr;
    # };
    # prowlarr.enable = true;
    # radarr.enable = true;
    # sonarr.enable = true;
    # bazarr.enable = true;
    # recyclarr = {
    #   enable = true;
    #   configFile = config.sops.secrets.recyclarr.path;
    # };
  };

  users.users.jellyfin.extraGroups = [
    "video"
    "render"
  ];

  # services.cloudflared.tunnels."${config.var.tunnelId}".ingress = {
  #   "media.${config.var.domain}" = "http://localhost:8096";
  #   "demandemedia.${config.var.domain}" = "http://localhost:5055";
  #   "bazarr.${config.var.domain}" = "http://localhost:6767";
  #   "prowlarr.${config.var.domain}" = "http://localhost:9696";
  #   "radarr.${config.var.domain}" = "http://localhost:7878";
  #   "sonarr.${config.var.domain}" = "http://localhost:8989";
  #   "transmission.${config.var.domain}" = "http://localhost:9091";
  # };
}
