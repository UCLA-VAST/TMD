{
  description = "TMD";
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
  };

  outputs = inputs: {

    defaultPackage.x86_64-linux = import ./TMD.nix {
      nixpkgs = inputs.nixpkgs;
    };
  };
}
