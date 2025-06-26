{ modulesPath, lib, pkgs, ... } @args:
{
  imports = [
    (modulesPath + "/installer/scan/not-detected.nix")
    (modulesPath + "/profiles/qemu-guest.nix")
    ./disk-config.nix
  ];
  
  boot.loader.grub = {
    efiSupport = true;
    efiInstallAsRemovable = true;
  };
  
  boot.growPartition = lib.mkDefault true;
  services.openssh.enable = true;
  services.qemuGuest.enable = lib.mkDefault true;

  environment.systemPackages = with pkgs; [
    curl
    git
    vim

  ];
  users.users.max = {
    isNormalUser = true;
    description  = "Max";
    extraGroups  = [ "networkmanager" "wheel" "audio" "video" ];
  };
  
  users.users.root.openssh.authorizedKeys.keys = [
    "ssh-ed25519 AAAAC3NzaC1IZDI1NTE5AAAAIEpP1E5cj88p2uHKPkFWw2yLHOE0GX13kKuiFUL3hHZV root@localhost"
  ];
  
  programs.ssh.startAgent = true;
  
  system.stateVersion = "25.05";
  }


