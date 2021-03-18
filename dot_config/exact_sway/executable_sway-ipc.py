#!/usr/bin/python
import i3ipc

ipc = i3ipc.Connection()

def on_window_focus(ipc, e):
    for c in ipc.get_tree():
        if c.focused:
            c.command('opacity 1')
        else:
            c.command('opacity 0.9')

ipc.on("window::focus", on_window_focus)
ipc.main() # enter command loop