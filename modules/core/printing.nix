{ ... }: {
	nix-config.defaultTags = {
		printing = false;
		desktop = false;
		laptop = false;
	};

	nix-config.apps = {
		printing = {
			tags = [ "printing" "desktop" "laptop" ];

			nixos = { pkgs, ... }: {
		        services.printing.enable = true;
		        services.printing.drivers = [ pkgs.hplip ];
		        services.avahi = {
		          enable = true;
		          nssmdns4 = true;
		          openFirewall = true;
		        };
			};
		};
	};
}
