{
  description = "nvim config start from kicktart.nvim";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
    rust-overlay.url = "github:oxalica/rust-overlay";
  };

  outputs =
    {
      nixpkgs,
      rust-overlay,
      flake-utils,
      ...
    }:
    flake-utils.lib.eachDefaultSystem (
      system:
      let
        name = "paradox8599-kickstart-nvim";

        overlays = [ (import rust-overlay) ];
        pkgs = import nixpkgs { inherit system overlays; };

        nightly = true;
        extensions = [
          "clippy"
          "rustfmt"
          "rust-src"
          "rust-docs"
          "rust-analyzer"
        ];

        rustToolchain =
          if nightly then
            pkgs.rust-bin.selectLatestNightlyWith (
              toolchain: toolchain.default.override { inherit extensions; }
            )
          else
            pkgs.rust-bin.stable."1.85.0".default.override {
              inherit extensions;
            };
      in
      {
        devShells.default = pkgs.mkShell {
          inherit name;
          buildInputs = [
            rustToolchain
            pkgs.pkg-config
          ];

          shellHook = '''';
        };

        nixConfig = {
          extra-substituters = [
            "https://paradox8599.cachix.org"
          ];
          extra-trusted-public-keys = [
            "paradox8599.cachix.org-1:FSZWbtMzDFaWlyF+hi3yCl9o969EQkWnh33PTgnwNEg="
          ];
        };
      }
    );
}
