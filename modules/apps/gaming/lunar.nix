{ lib, pkgs, config, options, username, ... }:

with lib;

let
    cfg = config.my.apps.gaming.lunar;
in {
    options.my.apps.gaming.lunar.enable = mkEnableOption "lunar";

    config = mkIf cfg.enable {
        home-manager.users.${username}.home.packages = with pkgs; [
            lunar-client
        ];
    };
}
