#!/usr/bin/python
import subprocess

options = {
    'shrug': '¯\_(ツ)_/¯',
    'date': lambda: 'current date',
}

key = subprocess.check_output(
    ['bemenu', '-i'],
    input=b'\n'.join(s.encode() for s in options.keys())
)

if not key in options:
    exit()

text = options[key]

if not isinstance(text, str):
    text = text()

import time
time.sleep(0.1)

subprocess.run(['wtype', text])
