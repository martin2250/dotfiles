#!/usr/bin/python
import i3ipc
import signal

ipc = i3ipc.Connection()

def on_window_focus(ipc: i3ipc.Connection, e):
    c : i3ipc.con.Con
    for c in ipc.get_tree():
        # only consider windows
        if c.type != 'con':
            continue
        opaque = c.focused
        opaque |= 'YouTube' in (c.name or '')
        opaque |= 'Netflix' in (c.name or '')
        opaque |= 'Zoom' in (c.name or '')
        opaque |= 'Jitsi' in (c.name or '')
        opaque |= 'vlc' == c.window_class
        if opaque:
            c.command('opacity 1')
        else:
            c.command('opacity 0.9')

def on_sigusr1(signum, frame):
    c : i3ipc.con.Con
    for c in ipc.get_tree():
        # only consider windows
        if c.type != 'con':
            continue
        c.command('opacity 1')

signal.signal(signal.SIGUSR1, on_sigusr1)

ipc.on("window::focus", on_window_focus)
ipc.main()