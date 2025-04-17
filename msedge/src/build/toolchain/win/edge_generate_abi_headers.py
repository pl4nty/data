#!/usr/bin/env python3
# Copyright (C) Microsoft Corporation. All rights reserved.
# Use of this source code is governed by a BSD-style license that can be
# found in the LICENSE file.

import argparse
import difflib
import filecmp
import io
import os
import tempfile
import shutil
import subprocess
import sys

# Add //build to PYTHONPATH so we can grab the win sdk version from vs_toolchain
sys.path.append(os.path.dirname(os.path.dirname(os.path.dirname(__file__))))
from vs_toolchain import SDK_VERSION


def run_abi(args, env_dict):
  abi_output_dir = tempfile.mkdtemp()
  delete_abi_output_dir = True

  try:
    popen = subprocess.Popen(args + ['-output', abi_output_dir, '-verbose'],
                             shell=True,
                             universal_newlines=True,
                             env=env_dict,
                             stdout=subprocess.PIPE,
                             stderr=subprocess.STDOUT)
    out, _ = popen.communicate()
    lines = out.splitlines()
    prefixes = ('in:', 'ref:', 'out:', 'time:')

    for line in lines:
      if (not line.startswith(prefixes) and not line.isspace()
          and not len(line) == 0):
        print(line)

    if popen.returncode != 0:
      return popen.returncode, abi_output_dir

    delete_abi_output_dir = False
  finally:
    if os.path.exists(abi_output_dir) and delete_abi_output_dir:
      shutil.rmtree(abi_output_dir)

  return 0, abi_output_dir


def main(args_raw):
  # Produce args
  parser = argparse.ArgumentParser(
      description='Generate ABI headers from WinMD')
  parser.add_argument('--abi_path', required=True, help='Path to abi.exe file.')
  parser.add_argument('--input_file',
                      required=True,
                      help='Location of the input WinMD file.')
  parser.add_argument('--source_dir',
                      required=True,
                      help='The checked-in pre-generated header files.')
  parser.add_argument('--output_dir',
                      required=True,
                      help='Location of the generated header files.')
  parser.add_argument('--output',
                      required=True,
                      action='append',
                      help='A file to emit in output_dir; repeatable')
  parser.add_argument('--architecture',
                      required=True,
                      help='Name of the arch for which we\'re generating code')
  parser.add_argument('--metadata_dir',
                      required=True,
                      help='Directory path that contains folders that contain Windows.Winmd file')
  args = parser.parse_args(args_raw)

  assert (os.path.isfile(args.input_file))

  # Copy checked-in outputs to final location.
  source = os.path.normpath(args.source_dir)
  outdir = args.output_dir

  source_exists = True
  if not os.path.isdir(source):
    source_exists = False
    if sys.platform != 'win32':
      print('Directory %s needs to be populated from Windows first' % source)
      return 1

    # This is a brand new generated directory that does not have outputs under
    # third_party/win_build_output/winmd. We create an empty directory for now.
    os.makedirs(source)

  for output in args.output:
    output_source_path = os.path.join(source, output)
    if not os.path.isfile(output_source_path):
      source_exists = False
      print("Failed to find %s at %s" % (output, output_source_path))
      if sys.platform != 'win32':
        print('File %s needs to be populated from Windows first' %
              output_source_path)
        return 1

      # This is a brand new generated file that does not have outputs under
      # third_party/win_build_output/winmd. We create an empty file for now.
      open(output_source_path, 'wb').close()
    shutil.copy(output_source_path, outdir)

  # On non-Windows, that's all we can do.
  if sys.platform != 'win32':
    return 0

  # On Windows, we need to have the abi.exe binary available to validate that we
  # have files checked in that match the inputs.
  if os.path.isfile(args.abi_path) == False:
    print("Failed to find ABI CLI in %s. Run gclient sync" % (args.abi_path))
    return 1

  # Validate that the metadata path passed is good
  assert (os.path.isfile(
      os.path.join(args.metadata_dir, SDK_VERSION, 'Windows.Winmd'))
  )
  sdk_metadata_dir = os.path.join(args.metadata_dir, SDK_VERSION)

  # Read the environment block from the file. This is stored in the format used
  # by CreateProcess. Drop last 2 NULs, one for list terminator, one for
  # trailing vs. separator.
  env_pairs = open(args.architecture).read()[:-2].split('\0')
  env_dict = dict([item.split('=', 1) for item in env_pairs])

  abi_args = [
      args.abi_path, '-input', args.input_file, '-reference', sdk_metadata_dir,
      '-ns-prefix', 'always'
  ]

  returncode, abi_output_dir = run_abi(abi_args, env_dict)
  if returncode != 0:
    return returncode

  # Now compare the output in abi_output_dir to the copied-over outputs.
  _, mismatch, errors = filecmp.cmpfiles(abi_output_dir, outdir, args.output)

  if mismatch:
    print('abi.exe output different from files in %s, see %s' %
          (outdir, abi_output_dir))
    for f in mismatch:
      fromfile = os.path.join(outdir, f)
      tofile = os.path.join(abi_output_dir, f)
      print(''.join(
          difflib.unified_diff(
              io.open(fromfile).readlines(),
              io.open(tofile).readlines(), fromfile, tofile)))

    print('To rebaseline:')
    print(r'  copy /y %s\* %s' % (abi_output_dir, source))
    return 1

  return 0


if __name__ == '__main__':
  sys.exit(main(sys.argv[1:]))
