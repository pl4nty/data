import os
import subprocess
import sys

from .canonical_platform import CanonicalPlatform
from .project_paths import SRC_DIR

def gn(gn_args, capture_output=False):
    executable = __get_executable_name()

    env = os.environ.copy()

    # To find the `gn` executable.
    env['CHROMIUM_BUILDTOOLS_PATH'] = __get_buildtools_path()

    # This tells depot_tools to use your locally
    # installed version of Visual Studio (by default,
    # depot_tools will try to use a google-internal version).
    if 'DEPOT_TOOLS_WIN_TOOLCHAIN' not in env:
        env['DEPOT_TOOLS_WIN_TOOLCHAIN'] = '0'

    call_args = [executable] + gn_args
    return subprocess.run(call_args, capture_output=capture_output, check=True,
                          env=env, text=True)


def __get_executable_name():
    executable = 'gn'
    if CanonicalPlatform.is_host_windows():
        executable += '.bat'
    return executable


def __get_buildtools_path():
    return os.path.join(SRC_DIR, 'buildtools')


if __name__ == '__main__':
    gn(sys.argv[1:])
