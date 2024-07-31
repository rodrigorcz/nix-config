{pkgs, ...}:{
  programs.rofi= {
    plugins = with pkgs; [ rofi-calc];
  };

  xdg.configFile."rofi/config.rasi".text = ''
    configuration {
      modi: "window,run,drun";
      window-thumbnail: false;
      font: "mono 12";
      show-icons: true;
      terminal: "kitty";
    }

    @theme "gruvbox-dark"
  '';
}
