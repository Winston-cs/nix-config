{ pkgs, config, options, lib, username, ... }:

with lib;

let
    cfg = config.my.apps.academic;
in {
    options.my.apps.academic.enable = mkEnableOption "academic";

    config = mkIf cfg.enable {
        home-manager.users.${username}.home.packages = with pkgs; [
            zotero
        ];
    };
}
