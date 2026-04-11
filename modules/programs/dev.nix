{ ... }: {
  nix-config.defaultTags = {
    dev = false;
  };

  nix-config.apps = {
    gui-code = {
      tags = [ "dev" ];

      nixos = { host, pkgs, ... }: {
        users.users.${host.username}.shell = pkgs.nushell;
      };

      home = { pkgs, host, ... }: {
        programs = {
          carapace = {
            enable = true;
            enableNushellIntegration = true;
          };
          eza = {
            enable = true;
            icons = "auto";
            enableNushellIntegration = true;
          };
          fzf = {
            enable = true;
          };
          git.enable = true;
          helix = {
              enable = true; 
              settings = {
                  editor = {
                      line-number = "relative";
                  };
                  keys.normal = {
                      space.space = "file_picker";
                      esc = [
                          "collapse_selection"
                          "keep_primary_selection"
                      ];
                  };
              };
              extraPackages = with pkgs; [
                  rust-analyzer
                  marksman
                  nil
                  nixd
                  svelte-language-server
                  superhtml
                  vscode-css-languageserver
                  typescript-language-server
              ];
          };
          jujutsu = {
            enable = true;
            settings = {
              ui = {
                default-command = ["log" "--no-pager"];
                diff-formatter = "${pkgs.delta}/bin/delta";
              };
              merge-tools.delta-diff-args = ["$left" "$right"];
              user.name = host.username;
              user.email = host.email;
              snapshot.max-new-file-size = "10MiB";
            };
          };
          kitty = {
            enable = true;
            settings = {
              enable_audio_bell = false;
            };
            extraConfig = ''
              background_opacity 0.85
              font_family      JetBrainsMono Nerd Font
              bold_font        JetBrainsMono Nerd Font Bold
              italic_font      JetBrainsMono Nerd Font Italic
              bold_italic_font JetBrainsMono Nerd Font Bold Italic
            '';
          };
          lazygit.enable = true;
          ripgrep.enable = true;
          starship = {
            enable = true;
            enableNushellIntegration = true;
          };
          television = {
            enable = true;             
      			settings = {
				      shell_integration.channel_triggers = {
				        "files" = [ "cat" "less" "head" "tail" "vim" "nvim" "bat" "cp" "mv" ];
				        "dirs"  = [ "cd" "ls" "rmdir" "z" ];
				        "env"   = [ "export" "unset" ];
				      };
				    };
          };
          zed-editor.enable = true;
          zoxide = {
            enable = true;
            enableNushellIntegration = true;
          };
        };
      };
    };
  };


  nix-config.homeApps = [
    {
      tags = [ "dev" ];
      packages = [
            "jjui"
            "godot"
            "bacon"
            "bat"
            "btop"
            "btrfs-progs"
            "bun"
            "dust"
            "dua"
            "elan"
            "fd"
            "gcc"
            "ghc"
            "glow"
            "gnumake"
            "gnupg"
            "gum"
            # "haskellPackages.cabal-install"
            # "haskellPackages.haskell-language-server"
            # "haskellPackages.stack"
            "hplip"
            "jq"
            "julia"

            "mprocs"
            "nix-output-monitor"
            "nmap"
            "openjdk"
            "openssl_3"
            "pandoc"
            "pango"
            "ripgrep-all"
            "texliveFull"
            "trash-cli"
            "typst"
            "typst-live"
            "vim"
            "wget"
            "which"
            
            "cargo"
            "clippy"
            "rustfmt"
            "rust-analyzer"
            "rustc"
      ];
    }
  ];
}
