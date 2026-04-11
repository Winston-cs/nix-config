{ ... }:
{
	nix-config.defaultTags = {
		virtalization = false;
	};

	nix-config.apps.virtualization = {
		nixos = { pkgs, host, ... }: {
			virtualisation.libvirtd.enable = true;
			users.users.${host.username}.extraGroups = [ "libvirtd" ];
			environment.systemPackages = with pkgs; [ virt-manager ];
		};
	};
}
