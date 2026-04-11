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
        	users.users.${host.username} = {
        		extraGroups = [ "wheel" "networkmanager" ];       		
        	};
      };

      home = { host, pkgs, ... }: {

      		home.username = host.username;
      		home.homeDirectory = host.homeDirectory;
      		home.stateVersion = "25.11";

      		programs.home-manager.enable = true;

      		programs.nushell = {
      			enable = true;

      			shellAliases = {
				      rm  = "trash-put";
				      lt  = "eza --tree --level=2";
				      llt = "eza -l --tree --level=2";
				    };

				    environmentVariables = {
				    	EDITOR = "${pkgs.helix}/bin/hx";
				    };

				    extraConfig = ''
				      # ── Carapace + Zoxide combined completer ──────────────────────────────
				      let carapace_completer = {|spans: list<string>|
				        carapace $spans.0 nushell ...$spans
				          | from json
				          | if ($in | default [] | where value =~ '^-.*ERR$' | is-empty) { $in } else { null }
				      }

				      let zoxide_completer = {|spans: list<string>|
				        $spans | skip 1 | zoxide query -l ...$in
				          | lines
				          | each {|line| $line | str replace $env.HOME '~' }
				          | where {|x| $x != $env.PWD }
				      }

				      let external_completer = {|spans: list<string>|
				        match $spans.0 {
				          z | zi | __zoxide_z | __zoxide_zi => $zoxide_completer
				          _ => $carapace_completer
				        } | do $in $spans
				      }

				      # ── Television: bootstrap shell integration on first run ──────────────────
							let tv_autoload = $nu.data-dir | path join "vendor/autoload/tv.nu"
							if not ($tv_autoload | path exists) {
							  mkdir ($nu.data-dir | path join "vendor/autoload")
							  tv init nu | save -f $tv_autoload
							}

				      # ── Fzf: Ctrl-R history search ────────────────────────────────────────
				      let fzf_history_keybinding = {
				        name: fzf_history
				        modifier: control
				        keycode: char_r
				        mode: [emacs, vi_normal, vi_insert]
				        event: {
				          send: executehostcommand
				          cmd: "commandline edit --replace (
				            history
				              | where exit_status == 0
				              | get command
				              | reverse
				              | uniq
				              | str join (char -i 0)
				              | fzf --scheme=history --read0 --tiebreak=chunk
				                    --layout=reverse --height=40%
				                    --preview='echo {}' --preview-window='bottom:2:wrap'
				                    -q (commandline)
				              | decode utf-8
				              | str trim
				          )"
				        }
				      }

				      # ── Fzf: Alt-C directory jumper ───────────────────────────────────────
				      let fzf_dir_keybinding = {
				        name: fzf_cd
				        modifier: alt
				        keycode: char_c
				        mode: [emacs, vi_normal, vi_insert]
				        event: {
				          send: executehostcommand
				          cmd: "cd (
				            fd --type d --hidden --exclude .git
				              | fzf --layout=reverse --height=40%
				              | decode utf-8
				              | str trim
				          )"
				        }
				      }

				      # ── Apply config ──────────────────────────────────────────────────────
				      $env.config = {
				        show_banner: false

				        completions: {
				          case_sensitive: false
				          quick: true
				          partial: true
				          algorithm: "fuzzy"
				          external: {
				            enable: true
				            max_results: 100
				            completer: $external_completer
				          }
				        }

				        keybindings: [
				          $fzf_history_keybinding
				          $fzf_dir_keybinding
				          # Ctrl-T is now owned by television via its vendor autoload script
				        ]
				      }
				      # ── Fastfetch (nitch) on shell start ──────────────────────────────────────
							${pkgs.nitch}/bin/nitch
				    '';
      		};

      		home.packages = with pkgs; [
      			wifitui
      			git
      			nushell
      			bitwarden-cli
      			# helix
      		];
      };
		};

		grub = {
			tags = [ "grub" ];

			nixos = { lib, ... }: {
				boot.loader = {
					grub.enable = true;
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
