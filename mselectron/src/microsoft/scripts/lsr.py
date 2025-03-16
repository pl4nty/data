#!/usr/bin/env python3

"""
List directory contents.
"""

import os
import pathlib
import sys

if __name__ == '__main__':
    pathname = sys.argv[1] if len(sys.argv) > 1 else os.getcwd()
    files = []
    for p in pathlib.Path(pathname).rglob('*'):
      files.append(os.path.join(pathname, p))
    files.sort()
    for file in files:
      print(file)
