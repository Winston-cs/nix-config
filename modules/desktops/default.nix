{ pkgs, ... }:
{
    imports = [
        ./cosmic.nix
        ./niri.nix
        ./hyprland.nix
        ./logins.nix
        ./components
        ./plasma.nix
    ];

    xdg.portal = {
        enable = true;
        extraPortals = with pkgs; [
            xdg-desktop-portal-gtk
            xdg-desktop-portal-wlr
        ];
    };
}
