{
  description = "NixOS config para VM provisionada via nix-anywhere";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";
    disko.url = "github:nix-community/disko";
    disko.inputs.nixpkgs.follows = "nixpkgs";
    nixos-hardware.url = "github:NixOS/nixos-hardware/master";
    nix-anywhere.url = "github:nix-community/nixos-anywhere";
  };

  outputs = { nixpkgs, disko, self, ... }: {
    nixosConfigurations.vm-nixos = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          # Módulos essenciais
          disko.nixosModules.disko
          ./configuration.nix
        ];
     };
  };
}
          
    





