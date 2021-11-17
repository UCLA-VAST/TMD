{ nixpkgs, ... }:
let
  pkgs = import nixpkgs {
    system = "x86_64-linux";
  };
in
  with pkgs;
  stdenv.mkDerivation {
    name = "TMD";

  # https://nixos.org/nix/manual/#builtin-filterSource
  src = builtins.filterSource
  (path: type: lib.cleanSourceFilter path type
  && baseNameOf path != "build"
  && baseNameOf path != "bin/*"
  && baseNameOf path != "data/*") ./.;

  buildInputs = [
    python27Full
    python27Packages.numpy
    python27Packages.scipy
    python27Packages.enum34
    python27Packages.scikit-learn
    python27Packages.munkres

    # optional dependencies
    python27Packages.h5py
    python27Packages.matplotlib
  ];

}
