{ pkgs, ... }:

{

  services.openssh.enable = true;

  users.users.ixxie = {
    home = "/home/ixxie";
    openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIPcwKdkSvC2AP3kbQva2nhLOM9ha4VIuHVTne5RPIXLz ixxie@contingent"
    ];
    extraGroups = [
      "wheel"
      "networkmanager"
      "adbusers"
      "audio"
      "docker"
    ];
    isNormalUser = true;
    shell = pkgs.nushell;
    useDefaultShell = false;
  };
  environment = {
    systemPackages = with pkgs; [
      helix
    ];
    variables = {
      EDITOR = "helix";
    };
  };
  boot.loader.grub.enable = true;
  system.stateVersion = "25.05";
}
