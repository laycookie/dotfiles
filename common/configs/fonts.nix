{ pkgs, config, ... }:
let
  	custom-font = pkgs.callPackage ./fonts-deriviation.nix {};
in
{
  fonts.packages = with pkgs; [
    # (nerdfonts.override { fonts = [ "FiraCode" "JetBrainsMono" "Iosevka" ]; })
    helvetica-neue-lt-std
    nerd-fonts.fira-code
    nerd-fonts.jetbrains-mono
    nerd-fonts.iosevka
    noto-fonts
    noto-fonts-color-emoji
    noto-fonts-cjk-sans
    noto-fonts-emoji
    fira-code
    fira-code-symbols
    custom-font.dank-mono
  ];
}
