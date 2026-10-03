{pkgs, ...}: {
  programs.tmux = {
    enable = true;
    extraConfig = ''
      set -g mouse on
      set-option -g status-position top
      set-option -g default-client-command "new-session -A"
    '';
  };
}
