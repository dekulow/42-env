{ pkgs ? import <nixpkgs> {} }:

pkgs.mkShell {
  buildInputs = [
    pkgs.gcc
    pkgs.clang_8
    pkgs.llvm_8
    pkgs.gdb
    pkgs.lldb
    pkgs.python3
    pkgs.python39Packages.pip
    pkgs.norminette
    pkgs.valgrind
    pkgs.fish
  ];
}