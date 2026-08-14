{
  description = "A Nix-flake-based development environment for CHIP-tools";

  # Flake inputs
  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";

  # Ensure chip-tools is included in the flake source.
  inputs.self.submodules = true;

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
        let
          chipTools = pkgs.stdenvNoCC.mkDerivation {
            pname = "chip-tools";
            version = "unstable";
            src = ./chip-tools;

            dontBuild = true;
            nativeBuildInputs = [ pkgs.makeWrapper ];

            postPatch = ''
              patchShebangs .
            '';

            installPhase = ''
              runHook preInstall

              mkdir -p "$out/libexec/chip-tools" "$out/bin"
              cp -R . "$out/libexec/chip-tools"

              for script in "$out/libexec/chip-tools"/*.sh; do
                name="''${script##*/}"
                makeWrapper "$script" "$out/bin/''${name%.sh}"
              done

              runHook postInstall
            '';
          };
        in
        {
          default = pkgs.mkShellNoCC {
            packages = with pkgs; [
              chipTools
              bash
              curl
              wget
              which
              sunxi-tools
              ubootTools
              android-tools
            ];
          };
        }
      );
    };
}
