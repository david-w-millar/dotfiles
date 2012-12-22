#!/bin/bash
#
# tmux init
#

show_status () { echo "::::: $1 :::::"; }

# Session name
SESSION=$USER

# Attach if exists
tmux has-session -t $SESSION
if [ $? -eq 0 ]; then
  show_status "Attaching to existing session"
  sleep 1
  tmux -2 attach -t $SESSION
  exit 0;
fi


# New session
tmux -2 new-session -d -s $SESSION

# Add windows
# Window 0 - vimwiki | htop
tmux set-window-option -t $SESSION -g automatic-rename off
tmux setw



# Back to window 0
tmux select-window -t $SESSION:0
tmux -2 attach -t $SESSION







