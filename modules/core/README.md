# Index

## Audio.nix
> enabling audio

This file has the **audio**, **desktop**, and **laptop** tags.
Enabling it sets up pipewire and adds audio to the user's group.

## Bluetooth.nix
> enabling bluetooth connectivity

This file has the **bluetooth**, **desktop**, and **laptop** tags.
Enabling it sets up blueman and enables bluetooth.

## Manditory.nix
> the settings needed for nix to boot and work

This file has the **core**, **grub**, and **efi** tags.
Core is required and grub or efi can be selected for bootloader.
It also sets up a shell and network connectivity.

## Printing.nix
> enabling printing

This file has the **printing**, **desktop**, and **laptop** tags.
Enabling it sets up pringing services.

## Ssh.nix
> enable ssh

This file has the **ssh**, **desktop**, and **laptop** tags.
Enabling it sets up port 22 for ssh connection.

## Upower.nix
> sets up upower and tlp

This file has the **upower** and **laptop** tags.
Enabling it sets up upower service and enables tlp for better
battery usage.

## Stylix.nix
> enable nice colors

This file has the **stylix** tag. Enabled by default, this
enables stylix colors and fonts.
