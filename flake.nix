{
  description = "dev shell for Jekyll (windows95 theme)";

  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";

  outputs = {
    self,
    nixpkgs,
  }: let
    forAllSystems = f:
      nixpkgs.lib.genAttrs ["x86_64-linux" "aarch64-linux"] (system:
        f (import nixpkgs {inherit system;}));
  in {
    devShells = forAllSystems (
      pkgs: let
        ruby = pkgs.ruby;
      in {
        default = pkgs.mkShell {
          packages = with pkgs; [
            ruby
            nodejs_20
            pkg-config
            gcc
            gnumake
            zlib
            libffi
            openssl
            libxml2
            libxslt
            libyaml
            git
          ];

          NOKOGIRI_USE_SYSTEM_LIBRARIES = "1";

          shellHook = ''
            set -e

            export GEM_HOME="$PWD/.gem"
            export GEM_PATH="$GEM_HOME"
            export PATH="$GEM_HOME/bin:$PATH"

            if ! command -v bundle >/dev/null 2>&1; then
              echo "Installing bundler locally into .gem ..."
              gem install bundler --no-document
            fi

            # Vendor gems into repo
            bundle config set --local path vendor/bundle >/dev/null 2>&1 || true

            echo
            echo "Jekyll dev shell ready."
            echo "First time:"
            echo "  bundle install"
            echo "Then:"
            echo "  bundle exec jekyll serve --livereload --drafts"
            echo
          '';
        };
      }
    );
  };
}
