#!/usr/bin/env python3

import argparse
import os
import subprocess

from lib.project_paths import ELECTRON_DIR

CC_ARGS = [
  '--cpp',
  '--cpp-roots', '../microsoft/src',
  '--cpp-ignore-roots', '../microsoft/src/third_party/ffmpeg',
]

GN_ARGS = [
  '--gn',
  '--gn-roots', '../microsoft',
  '--gn-ignore-roots', '../microsoft/src/third_party/ffmpeg',
]

JS_ARGS = [
  '--javascript',
  '--javascript-roots', '../microsoft/scripts',
  '--javascript-ignore-roots',
]

OBJC_ARGS = [
  '--objc',
  '--objc-roots', '../microsoft/src',
  '--objc-ignore-roots', '../microsoft/src/third_party/ffmpeg',
]

PATCHES_ARGS = [
  '--patches',
  '--patches-roots', '../microsoft/patches',
]

PY_ARGS = [
  '--python',
  '--python-roots', '../microsoft/scripts',
  '--python-ignore-roots', './script',
]

def main():
  parser = argparse.ArgumentParser(
      description='Lint src/electron and src/microsoft source code')
  parser.add_argument('--cc', action='store_true', default=False)
  parser.add_argument('--gn', action='store_true', default=False)
  parser.add_argument('--js', action='store_true', default=False)
  parser.add_argument('--objc', action='store_true', default=False)
  parser.add_argument('--patches', action='store_true', default=False)
  parser.add_argument('--py', action='store_true', default=False)
  options, unknown_args = parser.parse_known_args()

  args = [
    'node',
    os.path.join(ELECTRON_DIR, 'script', 'lint.js'),
  ]
  if options.cc:
    args += CC_ARGS
  if options.gn:
    args += GN_ARGS
  if options.js:
    args += JS_ARGS
  if options.objc:
    args += OBJC_ARGS
  if options.patches:
    args += PATCHES_ARGS
  if options.py:
    args += PY_ARGS
  if len(args) == 2:
    args += CC_ARGS + GN_ARGS + JS_ARGS + OBJC_ARGS + PATCHES_ARGS + PY_ARGS
  subprocess.check_call(args + unknown_args, cwd=ELECTRON_DIR)


if __name__ == '__main__':
  main()
