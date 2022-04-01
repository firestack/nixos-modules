{
  description = "A very basic flake";
  inputs.utils.url = "github:numtide/flake-utils";

  outputs = { self, nixpkgs, utils }: {} // utils.lib.eachDefaultSystem (system: {

    packages.hello = nixpkgs.legacyPackages.${system}.hello;

    defaultPackage = self.packages.${system}.hello;

  });
}
