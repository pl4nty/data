import os

from .canonical_platform import CanonicalPlatform


def get_binary_path(build_dir, platform=CanonicalPlatform.from_system()):
    binary_path_choices = {
      CanonicalPlatform.LINUX: 'electron',
      CanonicalPlatform.MAC: 'Electron.app/Contents/MacOS/Electron',
      CanonicalPlatform.WINDOWS: 'electron.exe',
    }
    binary_path = binary_path_choices[platform]

    full_path = os.path.join(build_dir, binary_path)
    return full_path
