#!/usr/bin/env python3

"""
Where to find the patchsets' `config.json` files
"""

CONFIGS_LIST = [
  # Backports from newer releases of Electron.
  'src/microsoft/patches/backports/electron/config.json',

  # Apply Electron patches for Chromium and friends.
  'src/electron/patches/config.json',

  # Backports from newer releases of Chromium.
  'src/microsoft/patches/backports/chromium/config.json',

  # Add Microsoft-specific features.
  'src/microsoft/patches/customization/config.json',
]
