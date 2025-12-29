{ ... }:
{
    imports = [
        ./audio
        ./bluetooth
        ./boot
        ./networking
        ./nix
        ./printer
        ./ssh
        ./timeZone
    ];

    services.udisks2.enable = true;
}
