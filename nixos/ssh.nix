{
  # --- SSH (disable if you don't want remote access) ---
  services.openssh = {
    enable = true;
    settings.PasswordAuthentication = false;
  };
}
