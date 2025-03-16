import os
import subprocess


def apt_get(apt_get_args, env=None, sudo=False):
    call_args = ['apt-get'] + apt_get_args
    if sudo:
        call_args = ['sudo'] + call_args
    subprocess.check_call(call_args, env=env)


def apt_get_install(packages, assume_yes=True, interactive=False, sudo=False):
    apt_get(['update'], sudo=sudo)

    env = os.environ.copy()
    if not interactive:
        env['DEBIAN_FRONTEND'] = 'noninteractive'

    install_args = []
    if assume_yes:
        install_args.append('--assume-yes')
    install_args += packages

    apt_get(['install'] + install_args, sudo=sudo, env=env)
