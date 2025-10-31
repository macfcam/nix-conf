{ pkgs, ... }:

{
  programs.tmux = {
    enable = true;
    shell = "${pkgs.fish}/bin/fish";
    mouse = true;
    clock24 = false;
    historyLimit = 50000;

    plugins = with pkgs; [
      tmuxPlugins.tmux-powerline
    ];

    extraConfig = ''
      # https://old.reddit.com/r/tmux/comments/mesrci/tmux_2_doesnt_seem_to_use_256_colors/
      set -g default-terminal "screen-256color"
      set -ga terminal-overrides ",xterm-256color:Tc"

      # renumber windows when last window was killer.
      set -g renumber-windows on

      # rename window to reflect current program
      setw -g automatic-rename on

      # set terminal title
      set -g set-titles on

      # activity
      set -g monitor-activity on
      set -g visual-activity off

      # faster command sequences
      set -s escape-time 10

      # start windows numbering at 1
      set -g base-index 1

      # sync panes
      bind C-y setw synchronize-panes

      # create new session
      bind C-c new-session

      # create new window
      bind C-n new-window

      # bind r to reload config
      bind C-r source-file ~/.tmux.conf \; display 'Config reloaded.'

      # pane navigation
      bind-key -n M-j select-pane -t :.-
      bind-key -n M-k select-pane -t :.+

      # window navigation
      bind-key -n M-h select-window -t :-
      bind-key -n M-l select-window -t :+

      bind-key -r H resize-pane -L +1
      bind-key -r J resize-pane -D +1
      bind-key -r K resize-pane -U +1
      bind-key -r L resize-pane -R +1
    '';
  };
}
