{
  description = "sway_setup — NixOS Sway rice: SwayFX + Islands Waybar, Catppuccin Mocha, matugen theming, recording studio";

  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-26.05";

  outputs = { nixpkgs, ... }:
    let
      pkgs = nixpkgs.legacyPackages.x86_64-linux;
    in
    {
      # Importable NixOS module (README: import via configuration.nix).
      nixosModules.default = import ./nixos/sway.nix;

      # DevShell with the key tools of the rice.
      devShells.x86_64-linux.default = pkgs.mkShell {
        name = "sway_setup";
        packages = with pkgs; [
          # rice core
          matugen
          awww
          swaynotificationcenter
          wlogout
          waybar
          foot
          fuzzel
          kanshi
          # recording studio
          wf-recorder
          slurp
          # window switching / overlays
          swayr
          wshowkeys
          sov
        ];
      };
    };
}
