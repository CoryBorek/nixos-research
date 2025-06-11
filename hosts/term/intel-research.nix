# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
 networking = {
    hostName = "nixos-intel-research";
  };

  users.users.user = {
    isNormalUser = true;
    description = "Research User";
    extraGroups = [
      "flatpak"
      "disk"
      "qemu"
      "docker"
      "kvm"
      "libvirtd"
      "sshd"
      "networkmanager"
      "wheel"
      "audio"
      "video"
      "libvirtd"
      "root"
    ];
    initialPassword = "changeme";
  };

  services.openssh.enable = true;
}
