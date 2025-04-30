{ config, pkgs, ... }:
{
  services.cliphist = {
    enable = true;
    allowImages = true;
    extraOptions = [
        "-max-dedupe-search"
        "10"
        "-max-items"
        "100"
    ];
  };
}
