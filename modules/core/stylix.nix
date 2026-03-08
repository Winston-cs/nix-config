{ inputs, ... }:
{
  # TODO: add stylix for darwin
  nix-config.defaultTags = {
    stylix = true;
  };

  nix-config.modules.nixos = [ inputs.stylix.nixosModules.stylix ];

  nix-config.apps.stylix = {
    tags = [ "stylix" ];

    nixos = { pkgs, ... }: let
      thm = "${pkgs.base16-schemes}/share/themes";
    in {
      stylix = {
        enable = true;
        polarity = "dark";
        base16Scheme = "${thm}/rose-pine.yaml";
        image = builtins.fetchurl {
						url = "https://w.wallhaven.cc/full/1q/wallhaven-1qqm13.jpg";
						sha256 = "0sp04swhnwk2zrzfpf64cskr1qv85p50mcldh928l7sph95pffap";
				};        

				cursor = {
				  package = pkgs.rose-pine-cursor;
				  name = "BreezeX-RosePine-Linux";
				  size = 32;
				};

				fonts = {
				  serif = {
				    package = (pkgs.callPackage ../../fonts {}).morcant;
				    name = "MorcantMono";
				  };

				  sansSerif = {
				    package = pkgs.google-fonts;
				    name = "Sulpher Point";
				  };

				  monospace = {
				    package = (pkgs.callPackage ../../fonts {}).narita;
				    name = "NaritaMono";
				  };

				  emoji = {
				    package = pkgs.fira-code-symbols;
				    name = "Fira Code Symbol";
				  };

				  sizes = {
				    applications = 12;
				    desktop = 12;
				    popups = 12;
				    terminal = 14;
				  };
				};
      };

      fonts = {
        enableDefaultPackages = true;
        fontDir.enable = true;
        fontconfig = {
          enable = true;
          antialias = true;
          cache32Bit = true;
          hinting.autohint = true;
          hinting.enable = true;
        };

        packages = with pkgs; [
          ubuntu-classic
          vazir-fonts
          noto-fonts
          noto-fonts-cjk-sans
          noto-fonts-color-emoji
          liberation_ttf
          nerd-fonts.fira-code
          nerd-fonts.droid-sans-mono
          nerd-fonts.jetbrains-mono
          fira-code-symbols
          mplus-outline-fonts.githubRelease
          dina-font
          proggyfonts
          liberation_ttf
          google-fonts
        ];
      };
    };
  };
}
