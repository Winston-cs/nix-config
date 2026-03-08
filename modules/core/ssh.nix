{ ... }: {
	
	nix-config.defaultTags = {
			ssh = false;
	};

	nix-config.apps = {
		printing = {
			tags = [ "ssh" ];

			nixos = { ... }: {
				networking.firewall = {
					enable = true;
					allowedTCPPorts = [ 22 ];
				};

				services.openssh = {
					enable = true;
					ports = [ 22 ];
					settings = {
						PasswordAuthentication = true;
						AllowUsers = null;
						UseDns = true;
						X11Forwarding = false;
						PermitRootLogin = "prohibit-password";
					};
				};
			};
		};		
	};
}
