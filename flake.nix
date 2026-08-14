{
  description = "A Nix-flake-based development environment for CHIP-tools";

  # Flake inputs
  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";

  # Flake outputs
  outputs =
    { self, ... }@inputs:

    let
      # The systems supported for this flake
      supportedSystems = [
        "x86_64-linux" # 64-bit Intel/AMD Linux
        "aarch64-linux" # 64-bit ARM Linux
        "aarch64-darwin" # 64-bit ARM macOS
      ];

      # Helper to provide system-specific attributes
      forEachSupportedSystem =
        f:
        inputs.nixpkgs.lib.genAttrs supportedSystems (
          system:
          f {
            inherit system;
            pkgs = import inputs.nixpkgs { inherit system; };
          }
        );
    in
    {
      devShells = forEachSupportedSystem (
        { pkgs, ... }:
        {
          default = pkgs.mkShellNoCC {
            # packages = with pkgs; [
            #   sunxi-tools
            #   ubootTools
            #   android-tools
            # ];

            env = {
              FEL = "sudo ${pkgs.sunxi-tools}/bin/sunxi-fel";
              FASTBOOT = "sudo ${pkgs.android-tools}/bin/fastboot";
              SNIB = "false";
            };
          };
        }
      );
    };
}
