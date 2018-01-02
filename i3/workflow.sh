#!/usr/bin/env bash

WS_LAYOUT_FILE=/home/alex/Config/i3/workflow_layout.json

i3-msg append_layout "$WS_LAYOUT_FILE"
terminator -T "Task" -e ~/Config/i3/task.sh &
terminator -T "IPython" -e "/home/alex/anaconda2/bin/ipython" &
terminator -T "Any" -e "/home/alex/anaconda2/bin/python ~/Desktop/drawille/examples/rotating_cube.py" &
terminator -T "Ranger" -x emacs25 -nw -f ranger-mode &
terminator -T "Clock" -x tty-clock &
terminator -T "Monitor" -x top &
