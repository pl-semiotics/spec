{ nixpkgs ? import <nixpkgs> {} }: with nixpkgs; with ocaml-ng.ocamlPackages_4_14;
stdenv.mkDerivation {
  pname = "wasm-spec";
  version = "idk";
  src = ./.;
  nativeBuildInputs = [ findlib ocamlbuild ocaml ];
  createFindlibDestdir = true;
}
