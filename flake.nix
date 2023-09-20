{
  description = "A simple Ruby development environment";

  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

  outputs = { self, nixpkgs }:
  let
    pkgs = nixpkgs.legacyPackages.x86_64-linux;
    ruby = pkgs.ruby;
  in {

    devShell.x86_64-linux = pkgs.mkShell {
      buildInputs = [ ruby pkgs.bundler pkgs.zlib pkgs.xz ];  # Added pkgs.xz for LZMA
      shellHook = ''
        echo "Welcome to the Ruby development environment!"
      '';
    };
  };
}
