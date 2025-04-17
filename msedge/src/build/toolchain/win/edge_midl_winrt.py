#!/usr/bin/env python3
# Copyright (C) Microsoft Corporation. All rights reserved.
# Use of this source code is governed by a BSD-style license that can be
# found in the LICENSE file.

import argparse
import difflib
import filecmp
import io
import os
import re
import shutil
import subprocess
import sys
import tempfile


# ZapTimestamp copied from midl.py
def ZapTimestamp(filename):
  contents = open(filename, 'rb').read()
  # midl.exe writes timestamp 2147483647 (2^31 - 1) as creation date into its
  # outputs, but using the local timezone.  To make the output timezone-
  # independent, replace that date with a fixed string of the same length.
  # Also blank out the minor version number.
  if filename.endswith('.tlb'):
    # See https://chromium-review.googlesource.com/c/chromium/src/+/693223 for
    # a fairly complete description of the .tlb binary format.
    # TLB files start with a 54 byte header. Offset 0x20 stores how many types
    # are defined in the file, and the header is followed by that many uint32s.
    # After that, 15 section headers appear.  Each section header is 16 bytes,
    # starting with offset and length uint32s.
    # Section 12 in the file contains custom() data. custom() data has a type
    # (int, string, etc).  Each custom data chunk starts with a uint16_t
    # describing its type.  Type 8 is string data, consisting of a uint32_t
    # len, followed by that many data bytes, followed by 'W' bytes to pad to a
    # 4 byte boundary.  Type 0x13 is uint32 data, followed by 4 data bytes,
    # followed by two 'W' to pad to a 4 byte boundary.
    # The custom block always starts with one string containing "Created by
    # MIDL version 8...", followed by one uint32 containing 0x7fffffff,
    # followed by another uint32 containing the MIDL compiler version (e.g.
    # 0x0801026e for v8.1.622 -- 0x26e == 622).  These 3 fields take 0x54 bytes.
    # There might be more custom data after that, but these 3 blocks are always
    # there for file-level metadata.
    # All data is little-endian in the file.
    assert contents[0:8] == b'MSFT\x02\x00\x01\x00'
    ntypes, = struct.unpack_from('<I', contents, 0x20)
    custom_off, custom_len = struct.unpack_from('<II', contents,
                                                0x54 + 4 * ntypes + 11 * 16)
    assert custom_len >= 0x54
    # First: Type string (0x8), followed by 0x3e characters.
    assert contents[custom_off:custom_off + 6] == b'\x08\x00\x3e\x00\x00\x00'
    assert re.match(
        br'Created by MIDL version 8\.\d\d\.\d{4} '
        br'at ... Jan 1. ..:..:.. 2038\n',
        contents[custom_off + 6:custom_off + 6 + 0x3e])
    # Second: Type uint32 (0x13) storing 0x7fffffff (followed by WW / 0x57 pad)
    assert contents[custom_off+6+0x3e:custom_off+6+0x3e+8] == \
        b'\x13\x00\xff\xff\xff\x7f\x57\x57'
    # Third: Type uint32 (0x13) storing MIDL compiler version.
    assert contents[custom_off + 6 + 0x3e + 8:custom_off + 6 + 0x3e + 8 +
                    2] == b'\x13\x00'
    # Replace "Created by" string with fixed string, and fixed MIDL version with
    # 8.1.622 always.
    contents = (
        contents[0:custom_off + 6] +
        b'Created by MIDL version 8.xx.xxxx at a redacted point in time\n' +
        # uint32 (0x13) val 0x7fffffff, WW, uint32 (0x13), val 0x0801026e, WW
        b'\x13\x00\xff\xff\xff\x7f\x57\x57\x13\x00\x6e\x02\x01\x08\x57\x57' +
        contents[custom_off + 0x54:])
  else:
    contents = re.sub(
        br'File created by MIDL compiler version 8\.\d\d\.\d{4} \*/\r\n'
        br'/\* at ... Jan 1. ..:..:.. 2038',
        br'File created by MIDL compiler version 8.xx.xxxx */\r\n'
        br'/* at a redacted point in time', contents)
    contents = re.sub(
        br'    Oicf, W1, Zp8, env=(.....) \(32b run\), '
        br'target_arch=(AMD64|X86|ARM64) 8\.\d\d\.\d{4}',
        br'    Oicf, W1, Zp8, env=\1 (32b run), target_arch=\2 8.xx.xxxx',
        contents)

    # Regular expression that finds the text 'Compiler settings for ' followed
    # by an absolute Windows file path followed by dash and the commit hash,
    # and replaces it with the text 'Compiler settings:'.
    contents = re.sub(br'Compiler settings for ([^\n]+):\r\n',
                      br'Compiler settings:\r\n', contents)

    # midl.exe puts the midl version into code in one place.  To have
    # predictable output, lie about the midl version if it's not 8.1.622.
    # This is unfortunate, but remember that there's beauty too in imperfection.
    contents = contents.replace(b'0x801026c, /* MIDL Version 8.1.620 */',
                                b'0x801026e, /* MIDL Version 8.1.622 */')
  open(filename, 'wb').write(contents)


# Add //build to PYTHONPATH so we can grab the win sdk version from vs_toolchain
sys.path.append(os.path.dirname(os.path.dirname(os.path.dirname(__file__))))
from vs_toolchain import SDK_VERSION


def run_midl(args, env_dict):
  midl_output_dir = tempfile.mkdtemp()
  delete_midl_output_dir = True

  try:
    popen = subprocess.Popen(args + ['/out', midl_output_dir],
                             shell=True,
                             universal_newlines=True,
                             env=env_dict,
                             stdout=subprocess.PIPE,
                             stderr=subprocess.STDOUT)
    out, _ = popen.communicate()
    lines = out.splitlines()
    prefixes = ('in:', 'ref:', 'out:', 'time:', 'Processing ',
                '64 bit Processing ', 'MIDLRT Processing',
                '64 bit MIDLRT Processing', 'Microsoft (R)', 'Copyright (c)')

    for line in lines:
      if (not line.startswith(prefixes) and not line.isspace()
          and not len(line) == 0):
        print(line)

    if popen.returncode != 0:
      return popen.returncode, midl_output_dir

    for f in os.listdir(midl_output_dir):
      ZapTimestamp(os.path.join(midl_output_dir, f))

    delete_midl_output_dir = False
  finally:
    if os.path.exists(midl_output_dir) and delete_midl_output_dir:
      shutil.rmtree(midl_output_dir)

  return 0, midl_output_dir


def main(arch, gendir, outdir, h, dlldata, iid, proxy, clang, sdk_dir, idl,
         *flags):

  # Copy checked-in outputs to final location.
  source = gendir
  if os.path.isdir(os.path.join(source, os.path.basename(idl))):
    source = os.path.join(source, os.path.basename(idl))
  source = os.path.join(source, arch.split('.')[1])  # Append x86, x64 or arm64.
  source = os.path.normpath(source)

  source_exists = True
  if not os.path.isdir(source):
    source_exists = False
    if sys.platform != 'win32':
      print('Directory %s needs to be populated from Windows first' % source)
      return 1

    # This is a brand new IDL file that does not have outputs under
    # third_party\win_build_output\midl. We create an empty directory for now.
    os.makedirs(source)

  common_files = [h, iid]
  tlb = None

  if dlldata != 'none':
    # Not all projects use dlldta files.
    common_files += [dlldata]
  else:
    dlldata = None

  # Not all projects use proxy files
  if proxy != 'none':
    # Not all projects use proxy files.
    proxy_header_file = proxy.replace('_p.c', '_p.h')
    common_files += [proxy, proxy_header_file]
  else:
    proxy = None

  for source_file in common_files:
    file_path = os.path.join(source, source_file)
    if not os.path.isfile(file_path):
      source_exists = False
      if sys.platform != 'win32':
        print('File %s needs to be generated from Windows first' % file_path)
        return 1

      # Either this is a brand new IDL file that does not have outputs under
      # third_party\win_build_output\midl or the file is (unexpectedly) missing.
      # We create an empty file for now. The rest of the machinery below will
      # then generate the correctly populated file using the MIDL compiler and
      # instruct the developer to copy that file under
      # third_party\win_build_output\midl.
      open(file_path, 'wb').close()
    shutil.copy(file_path, outdir)

  # On non-Windows, that's all we can do.
  if sys.platform != 'win32':
    return 0

  # On Windows, run midl.exe on the input and check that its outputs are
  # identical to the checked-in outputs (after replacing guids if
  # |dynamic_guids| is specified).

  # Read the environment block from the file. This is stored in the format used
  # by CreateProcess. Drop last 2 NULs, one for list terminator, one for
  # trailing vs. separator.
  env_pairs = open(arch).read()[:-2].split('\0')
  env_dict = dict([item.split('=', 1) for item in env_pairs])

  # some dirs needed for MidlRT.
  sdk_metadata_dir = os.path.join(sdk_dir.replace('/', '\\'), 'UnionMetadata',
                                  SDK_VERSION)
  sdk_include_dir = os.path.join(sdk_dir.replace('/', '\\'), 'Include',
                                 SDK_VERSION)
  input_dir = os.path.dirname(idl).replace('/', '\\')
  # Fix slashes in the clang_cl_file argument
  clang_cl_file = clang.replace('/', '\\')

  # Extract the /D options and send them to the preprocessor.
  preprocessor_options = '-E -nologo -Wno-nonportable-include-path'
  preprocessor_options += ''.join(
      [' ' + flag for flag in flags if flag.startswith('/D')])
  # using /nomd to not generate winmd file as no winmd is used in our build system.
  args = [
      'midl', '/nologo', '/nomd', '/winrt', '/ns_prefix', '/I',
      '{sdk_include_dir}\\winrt;{sdk_include_dir}\\shared;{sdk_include_dir}\\um;{input_dir}'
      .format(sdk_include_dir=sdk_include_dir,
              input_dir=input_dir), '/metadata_dir', sdk_metadata_dir
  ] + list(flags) + ['/h', h] + (['/dlldata', dlldata] if dlldata else []) + [
      '/iid', iid
  ] + (['/proxy', proxy] if proxy else
       []) + ['/cpp_cmd', clang_cl_file, '/cpp_opt', preprocessor_options, idl]

  returncode, midl_output_dir = run_midl(args, env_dict)
  if returncode != 0:
    return returncode

  # Now compare the output in midl_output_dir to the copied-over outputs.
  _, mismatch, errors = filecmp.cmpfiles(midl_output_dir, outdir, common_files)

  if mismatch:
    print('midl.exe output different from files in %s, see %s' %
          (outdir, midl_output_dir))
    for f in mismatch:
      if f.endswith('.tlb'): continue
      fromfile = os.path.join(outdir, f)
      tofile = os.path.join(midl_output_dir, f)
      print(''.join(
          difflib.unified_diff(
              io.open(fromfile).readlines(),
              io.open(tofile).readlines(), fromfile, tofile)))

    print('To rebaseline:')
    print(r'  copy /y %s\* %s' % (midl_output_dir, source))
    return 1

  return 0


if __name__ == '__main__':
  sys.exit(main(*sys.argv[1:]))
