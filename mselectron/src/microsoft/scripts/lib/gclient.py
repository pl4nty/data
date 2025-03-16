import os
import subprocess

from .canonical_platform import CanonicalPlatform
from .filesystem import append_to_file, print_file
from .vs_toolchain import override_toolchain_hash_in_environment


def gclient(*gclient_args):
    # Convert it from a tuple.
    gclient_args = list(gclient_args)
    executable = __get_executable_name()

    env = os.environ.copy()

    # This tells depot_tools to use your locally
    # installed version of Visual Studio (by default,
    # depot_tools will try to use a google-internal version).
    # If the user has already set that var, do nothing.
    if 'DEPOT_TOOLS_WIN_TOOLCHAIN' not in env:
        env['DEPOT_TOOLS_WIN_TOOLCHAIN'] = '0'

    # Don't try to update depot tools to the latest version
    # before running gclient.
    # https://www.chromium.org/developers/how-tos/depottools#TOC-Disabling-auto-update
    env['DEPOT_TOOLS_UPDATE'] = '0'

    override_toolchain_hash_in_environment(env)

    call_args = [executable] + gclient_args
    subprocess.check_call(call_args, env=env)


def __get_executable_name():
    executable = 'gclient'
    if CanonicalPlatform.is_host_windows():
        executable += '.bat'
    return executable


def get_gclient_os(canonical_platform):
    return {
        CanonicalPlatform.LINUX: 'unix',
        CanonicalPlatform.MAC: 'mac',
        CanonicalPlatform.WINDOWS: 'win',
    }[canonical_platform]


def config(url, name=None, custom_vars=None, cache_dir=None,
           target_os=None, print_the_config=False):
    gclient_args = ['config', '--unmanaged']

    if name is not None:
        gclient_args += ['--name', name]
    if custom_vars is not None:
        gclient_args += map(lambda i: __format_custom_var_argument(*i),
                            custom_vars.items())

    # Always pass the '--cache-dir' option to ignore the `GIT_CACHE_PATH`
    # environment variable. If `cache_dir` is `None`, pass a "None" string.
    gclient_args += ['--cache-dir', str(cache_dir)]
    gclient_args.append(url)

    gclient(*gclient_args)
    gclient_file_name = '.gclient'

    if target_os is not None and target_os != 'host':
        # There's no command-line argument to set target OS for gclient.
        target_os = get_gclient_os(target_os)
        append_to_file(f"target_os = ['{target_os}']\n", gclient_file_name)

    if print_the_config:
        print_file(gclient_file_name)


def __format_custom_var_argument(name, value):
    # Let's pass all arguments' values in quotes except booleans.
    string_value = value if isinstance(value, bool) else f'"{value}"'
    return f'--custom-var={name}={string_value}'
