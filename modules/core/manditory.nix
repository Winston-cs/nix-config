{ inputs, ... }:
{
	nix-config.defaultTags = {
			core = true;	
			grub = false;
			efi = false;
		};

	nix-config.modules.nixos = [ inputs.determinate.nixosModules.default ];

	nix-config.apps = {
		# parts: timeZone, i18n, networking
		core = {
			tags = [ "core" ];

			nixos = { host, ... }: {
        	time.timeZone = "America/New_York";
        	i18n.defaultLocale = "en_US.UTF-8";
        	networking.networkmanager.enable = true;

        	users.users.${host.username}.extraGroups = [ "wheel" "networkmanager" ];
      };

      home = { host, pkgs, ... }: {

      		home.username = host.username;
      		home.homeDirectory = host.homeDirectory;
      		home.stateVersion = "25.11";

      		programs.home-manager.enable = true;

      		programs.zsh = let
						alias = {
						    nv = "${inputs.nixvim.packages.${host.system}.code}/bin/nvim";
						    wr = "${inputs.nixvim.packages.${host.system}.writer}/bin/nvim";
						    rm = "trash-put";
						    cd = "z";
						    wallpaper = "nix run ~/nix/machines/#random-wallpaper --impure ~/Pictures/wallpaper/";
						    zj = "zellij";
						    ls = "eza --icons=always";
						};
						extra = ''
						    export EDITOR="${pkgs.helix}/bin/hx"
						    export PATH="$HOME/.cargo/bin:$PATH"
						    export PATH="$HOME/.julia/packages/LanguageServer/Fwm1f/src/LanguageServer.jl:$PATH"
						    export STARSHIP_CONFIG=$HOME/nixcfg/dotfiles/starship.toml

						    # starship + zoxide setup
						    eval "$(starship init zsh)"
						    eval "$(zoxide init zsh)"
    
						    # carapace setup
						    export CARAPACE_BRIDGES='zsh,fish,bash,inshellisense' # optional
						    zstyle ':completion:*' format $'\e[2;37mCompleting %d\e[m'
						    source <(carapace _carapace)

						    ${pkgs.nitch}/bin/nitch 
						'';
      		in {
      			enable = true;
      			autocd = true;
      			defaultKeymap = "viins";
      			autosuggestion.strategy = [ "history" ];
      			enableCompletion = true;
      			shellAliases = alias;
      			syntaxHighlighting.enable = true;
      			envExtra = extra;
      		};
      };
		};

		grub = {
			tags = [ "grub" ];

			nixos = { ... }: {
				boot.loader = {
					grub.enable = true;
					grub.splashImage = builtins.fetchurl {
						url = "https://w.wallhaven.cc/full/1q/wallhaven-1qqm13.jpg";
						sha256 = "0sp04swhnwk2zrzfpf64cskr1qv85p50mcldh928l7sph95pffap";
					};
				};
			};
		};

		efi = {
			tags = [ "efi" ];

			nixos = { ... }: {
				boot.loader = {					
					systemd-boot.enable = true;
					efi.canTouchEfiVariables = true;
				};
			};
		};		
	};
}
