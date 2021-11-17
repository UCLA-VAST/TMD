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
    python38Packages.numpy
    python38Packages.scipy
    python38Packages.enum34
    python38Packages.scikit-learn
    python38Packages.munkres
    python38Packages.cached-property

    # optional dependencies
    python38Packages.h5py
    python38Packages.matplotlib
  ];

}
