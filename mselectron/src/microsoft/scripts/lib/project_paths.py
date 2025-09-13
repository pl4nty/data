"""
Project paths
"""

import os

_THIS_FILE_PATH = os.path.abspath(__file__)

# A root directory of this repository.
REPO_ROOT_DIR = os.path.dirname(os.path.dirname(os.path.dirname(
    _THIS_FILE_PATH)))

# A root directory for the whole project.
# Contains a .gclient config file and a Chromium checkout.
PROJECT_ROOT_DIR = os.path.dirname(os.path.dirname(REPO_ROOT_DIR))

# A Chromium repo root.
SRC_DIR = os.path.join(PROJECT_ROOT_DIR, 'src')

# An Electron repo root inside the Chromium checkout.
ELECTRON_DIR = os.path.join(SRC_DIR, 'electron')

# This repo root inside the Chromium checkout.
MICROSOFT_DIR = os.path.join(SRC_DIR, 'microsoft')

# RBE credential helper directory
RBE_HELPER_DIR = os.path.join(PROJECT_ROOT_DIR, 'rbe-credential-helper')
