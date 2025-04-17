# Copyright (C) Microsoft Corporation. All rights reserved.

import argparse
import subprocess
import sys


def main(args):
  subprocess.check_call(
      ['xcrun', 'lipo', args.input, '-output', args.output, '-create'])
  subprocess.check_call(
      ['xcrun', 'lipo', args.output, '-output', args.output] +
      [arg for arch in args.archs for arg in ['-extract', arch]])
  # Grant the write permission to output binary to avoid the permission denied
  # error during codesign.
  subprocess.check_call(['chmod', 'u+w', args.output])


if __name__ == '__main__':
  parser = argparse.ArgumentParser()
  parser.add_argument('--input', required=True, help='Path to input binary')
  parser.add_argument('--output', required=True, help='Path to output binary')
  parser.add_argument('--archs', required=True, nargs='+', help='Archs to keep')
  main(parser.parse_args(sys.argv[1:]))
