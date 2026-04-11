{ ... }:
{
	nix-config.defaultTags = {
		yggdrasil = false;
	};

	nix-config.apps.yggdrasil = {
		tags = [ "yggdrasil" ];

		nixos = { ... }: {
			
			services.yggdrasil = {
				enable = true;
				settings = {
					IfMTU = 65535;
					IfName = "ygg0";

					# Listen = [
					# 	"tls://[::]:0"
					# ];					

					PrivateKeyPath = "/home/winston/nix/machines/.yggSecretKey";
				  NodeInfoPrivacy = true;

					Peers = [
						"quic://mo.us.ygg.triplebit.org:443"
						"quic://leo.node.3dt.net:9004"
						"quic://ygg-atvps.axxa.dev:18083"
					];

					MulticastInterfaces = [
						{
							Regex = ".*";
							Beacon = false; # Enable to share node on local networks
							Listen = true; # Enable to look out for local connection on yggdrasil
							Password = "";
						}
					];

					NodeInfo = {
					  name = "NY-node";
					  contact = "none";
					};
				};
			};
		};
	};
}
