{ ... }: {
	nix-config.defaultTags = {
		bluetooth = false;
		desktop = false;
		laptop = false;
	};

	nix-config.apps = {
		bluetooth = {
			tags = [ "bluetooth" "desktop" "laptop" ];

			nixos = { ... }: {
				hardware = {
					bluetooth.enable = true;
					bluetooth.powerOnBoot = true;
				};
				services.blueman.enable = true;
			};
		};
	};
}
