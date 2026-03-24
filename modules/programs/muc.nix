{ ... }:
{
	nix-config.defaultTags = {
		muc = false;
	};

	nix-config.apps.muc = {
		tags = [ "muc" ];
		
		home = { pkgs, ... }: {
			home.packages = with pkgs; [
				mumble
				gajim
			];
		};
	};
}
