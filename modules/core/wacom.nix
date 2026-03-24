{ ... }:
{
	nix-config.defaultTags = {
		wacom = false;
	};

	nix-config.apps.wacom = {
		tags = [ "wacom" ];

		nixos = { pkgs, ... }: {
			hardware.opentabletdriver.enable = true;
			hardware.uinput.enable = true;
			boot.kernelModules = [ "uinput" ];

			environment.systemPackages = with pkgs; [
				opentabletdriver				
				libwacom
			];
		};
	};
}
