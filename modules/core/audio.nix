{ ... }: {
	nix-config.defaultTags = {
		audio = false;
		desktop = false;
		laptop = false;
	};

	nix-config.apps = {
		audio = {
			tags = [ "audio" "desktop" "laptop" ];

			nixos = { host, pkgs, ... }: {
				services.pipewire = {
					enable = true;
					audio.enable = true;
					pulse.enable = true;
					alsa = {
						enable = true;
						support32Bit = true;
					};
					jack.enable = true;
				};

				environment.systemPackages = with pkgs; [
					alsa-utils
					playerctl
				];

				users.users.${host.username}.extraGroups = [ "audio" ];
			};
		};
	};
}
