{
    description = "the configuration of my machines.";

    outputs = { flake-parts, determinate, stylix, ... } @ inputs: flake-parts.lib.mkFlake { inherit inputs; } {
        
        imports = [
            (inputs.import-tree ./hosts)
            (inputs.import-tree ./modules)
            inputs.nix-config-modules.flakeModule
        ];

        # please ignore this. it throws an error if I don't define homeApps here. its weird...
        nix-config.homeApps = [
            {
                tags = [ "laptop" ];
                packages = [ "hello" ];
            }
        ];

        systems = [ "x86_64-linux" "aarch64-darwin" "aarch64-linux" ];
    };
    
    inputs = {

        determinate.url = "https://flakehub.com/f/DeterminateSystems/determinate/*";
        home-manager.url = "github:nix-community/home-manager";
        flake-parts.url = "github:hercules-ci/flake-parts";
        import-tree.url = "github:vic/import-tree";
        nix-config-modules.url = "github:chadac/nix-config-modules";
        nixos-hardware.url = "github:Nixos/nixos-hardware/master";

        copyparty.url = "github:9001/copyparty";
        niri.url = "github:sodiboo/niri-flake";
        nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
        nixvim.url = "github:blank2121/nixvim";
        stylix.url = "github:danth/stylix";
        xremap-flake.url = "github:xremap/nix-flake";
        zen-browser.inputs.nixpkgs.follows = "nixpkgs";
        zen-browser.inputs.home-manager.follows = "home-manager";
        zen-browser.url = "github:0xc000022070/zen-browser-flake";
    };
}
