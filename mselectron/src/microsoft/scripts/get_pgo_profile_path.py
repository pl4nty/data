#!/usr/bin/env python3

"""
Return a path to the current profile to feed to the build system.
"""

import argparse
import os
import sys

from lib.build_flavour import ElectronFlavour
from lib.canonical_arch import CanonicalArch
from lib.canonical_platform import CanonicalPlatform
from lib.project_paths import REPO_ROOT_DIR

# Absolute path to the directory that stores pgo profiles.
PGO_PROFILE_DIR = os.path.join(REPO_ROOT_DIR, 'build', 'pgo_profiles')


def main():
  parser = argparse.ArgumentParser(
      description=__doc__,
      formatter_class=argparse.RawDescriptionHelpFormatter)
  parser.add_argument(
      '--flavour',
      required=True, choices=ElectronFlavour.get_all(),
      help="build flavour, e.g. electron, vscode")
  parser.add_argument(
      '--target-cpu',
      required=True, choices=CanonicalArch.get_all(),
      help='identifier of a specific target platform + architecture')

  args = parser.parse_args()

  if CanonicalPlatform.is_host_linux():
      target = 'linux'
  elif CanonicalPlatform.is_host_mac():
      if args.target_cpu == CanonicalArch.X64:
          target = 'mac'
      else:
          target = 'mac-arm'
  elif CanonicalPlatform.is_host_windows():
      if args.target_cpu == CanonicalArch.X64:
          target = 'win64'
      elif args.target_cpu == CanonicalArch.X86:
          target = 'win32'
      elif args.target_cpu == CanonicalArch.ARM64:
          target = 'win-arm64'
  else:
      raise Exception('Unknown host OS')

  profile_path = os.path.join(PGO_PROFILE_DIR,
                              f'{args.flavour}-{target}.profdata')
  print(profile_path, end='')


if __name__ == '__main__':
    sys.exit(main())
