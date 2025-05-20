{ pkgs, ... }:

{
  boot.loader.grub.enable = true;

  services.openssh.enable = true;

  users.users.ixxie = {
    isNormalUser = true;
    extraGroups = [ "wheel" ];
    openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIPcwKdkSvC2AP3kbQva2nhLOM9ha4VIuHVTne5RPIXLz ixxie@contingent"
    ];
  };

  environment.systemPackages = with pkgs; [ helix ];

  system.stateVersion = "25.05";
}
