_ : {
  services.dunst = {
    enable = true;
    settings = {
      global = {
        font = "Cantarell Noto Sans 10";
        geometry = "500x5-5+30";
      };

      urgency_low = {
        background = "#1c1c1c";  # Gruvbox dark4
        foreground = "#ebdbb2";  # Gruvbox white
        frame_color = "#ebdbb2"; # Gruvbox white
      };

      urgency_normal = {
        background = "#1c1c1c";  # Gruvbox dark0
        foreground = "#d79921";  # Gruvbox orange
        frame_color = "#d79921"; # Gruvbox orange
      };

      urgency_critical = {
        background = "#1c1c1c";  # Gruvbox dark0
        foreground = "#fb4934";  # Gruvbox red
        frame_color = "#fb4934"; # Gruvbox red
      };
    };
  };
}