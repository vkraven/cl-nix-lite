{
  pkgs ? import <nixpkgs> {}
, cl-nix-lite ? pkgs.callPackage ../.. {}
}:

with (pkgs.extend cl-nix-lite).lispPackagesLite; lispDerivation {
  src = pkgs.lib.cleanSource ./.;
  lispSystem = "dev";
  lispDependencies = [ arrow-macros ];
  buildInputs = [ pkgs.sbcl ];
}
