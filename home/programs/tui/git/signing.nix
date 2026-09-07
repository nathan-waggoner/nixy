# This file is used to sign git commits using an SSH key.
{
  # CHANGEME: change this to your own SSH key.
  home.file.".ssh/allowed_signers".text = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAICXTZJHUaQ6pWMgH12jLQC1wEumFrFgrHP4g0WdbQiTm nathan@nathanwaggoner.com";

  programs.git = {
    signing.format = "openpgp";
    settings = {
      commit.gpgsign = true;
      gpg.ssh.allowedSignersFile = "~/.ssh/allowed_signers";
      gpg.format = "ssh";
      user.signingkey = "~/.ssh/key.pub";
    };
  };
}
