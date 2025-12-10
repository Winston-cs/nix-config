{ pkgs ? import <nixpkgs> {} }:
{
  narita = pkgs.callPackage ./narita {};
  morcant = pkgs.callPackage ./morcant {};
}
