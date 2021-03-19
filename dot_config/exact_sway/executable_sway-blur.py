#!/usr/bin/python
import subprocess, os, signal, sys
import i3ipc

# kill other running instances
proc = subprocess.run(['pgrep' , '-f', sys.argv[0]], stdout=subprocess.PIPE)
if proc.returncode == 0:
    for pid in proc.stdout.splitlines():
        pid = int(pid)
        if pid != os.getpid():
            print(f'kill other running instance {pid}')
            os.kill(pid, signal.SIGTERM)

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
        opaque |= 'vlc' == c.window_class
        if opaque:
            c.command('opacity 1')
        else:
            c.command('opacity 0.9')

ipc.on("window::focus", on_window_focus)
ipc.main()