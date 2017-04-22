#!/usr/bin/env python3
import os
import sys

PROJECT_DIR = os.path.dirname(os.path.abspath(__file__))

venv_activate = os.path.join(PROJECT_DIR, 'venv', 'bin', 'activate_this.py')

with open(venv_activate, 'r') as activator:
        exec(activator.read(), dict(__file__=venv_activate))

sys.path.insert(0, PROJECT_DIR)

from server import app
from flup.server.fcgi import WSGIServer

WSGIServer(app).run()

