{
  description = "A flake root for shared nixos modules";

  outputs = { ... }: {
    nixosModules = {
      "nix/daemon/structuredExtraOptions" = import ./+-nixos/nix-daemon/structuredExtraOptions.nix;
      "nix/daemon/experimentalFeatures" = import ./+-nixos/nix-daemon/experimentalFeatures.nix;
    };

    darwinModules = {
      "nix/registry" = import ./+-darwin/nix.registry.nix;
      "nix/daemon/autoOptimiseStore" = import ./+-darwin/nix-daemon/autoOptimiseStore;
      homebrew = import ./+-darwin/homebrew.nix;
    };

  };
}
