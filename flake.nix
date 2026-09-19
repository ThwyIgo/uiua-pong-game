{
  description = "Uiua pong game with Raylib";

  inputs = {
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = nixpkgs.legacyPackages.${system};

        editor = pkgs.vscode-with-extensions.override {
          vscode = pkgs.vscodium;
          vscodeExtensions = with pkgs.vscode-extensions; [
            uiua-lang.uiua-vscode
          ];
        };

        # Conjunto completo de bibliotecas para janela, áudio e GPU do Raylib
        graphicsLibs = with pkgs; [
          raylib
          libGL
          libx11
          libXcursor
          libXrandr
          libxinerama
          libXi
          libxext
          libXfixes
          wayland
          libxkbcommon
          alsa-lib
        ];
      in {
        devShells.default = pkgs.mkShell {
          packages = with pkgs; [
            uiua
            editor
            raylib
            uiua386
          ] ++ graphicsLibs;

          shellHook = ''
            # Monta o path dinâmico com todas as libs necessárias do X11/GL
            export LD_LIBRARY_PATH="${pkgs.lib.makeLibraryPath graphicsLibs}:$LD_LIBRARY_PATH"
          '';
        };
      }
    );
}
