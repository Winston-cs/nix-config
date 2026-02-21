{ ... }:
{
	nix-config.defaultTags = {
		tailscale = false;
	};

	nix-config.apps.tailscale = {
		tags = [ "tailscale" ];

		nixos = { ... }: {
			services.tailscale.enable = true;
		};
	};
}
