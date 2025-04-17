# Copyright (C) Microsoft Corporation. All rights reserved.

import shutil
import subprocess
import sys


def main(args):
  sources = args[0].split(',')
  patches = args[1].split(',')
  outputs = args[2].split(',')
  count = len(sources)
  if len(patches) != count or len(outputs) != count:
    sys.stderr.write(
        'the count of sources and patches and outputs should all be equal')
    sys.exit(1)
  for i in range(count):
    shutil.copyfile(sources[i], outputs[i])
    process = subprocess.Popen(['patch', outputs[i], patches[i]],
                               stdout=subprocess.PIPE,
                               stderr=subprocess.STDOUT,
                               universal_newlines=True)
    stdout, _ = process.communicate()
    if process.returncode:
      sys.stderr.write(stdout)
      sys.exit(1)


if __name__ == '__main__':
  sys.exit(main(sys.argv[1:4]))
