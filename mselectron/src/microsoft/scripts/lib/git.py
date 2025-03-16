from pathlib import Path
import subprocess
import sys

from .filesystem import mkdir_p

VERBOSE = True
# VERBOSE = os.getenv('GIT_VERBOSE')


def git(*git_args):
    call_args = ['git'] + list(git_args)

    if VERBOSE:
        print('$', *call_args, file=sys.stderr)
    output = subprocess.check_output(call_args, text=True)

    if VERBOSE:
        print(str(output), file=sys.stderr)

    return output


def is_git_repo(dir_path: Path) -> bool:
    return dir_path.is_dir() and (dir_path / '.git').is_dir()


class GitUser:
    def __init__(self, name, email):
        self._name = name
        self._email = email

    @property
    def name(self):
        return self._name

    @property
    def email(self):
        return self._email

    @property
    def full_name(self):
        return f"{self._name} <{self._email}>"


fake_user = GitUser(name="Electron at Microsoft",
                    email="electron@microsoft.com")


class Repository:
    def __init__(self, directory, user=fake_user, init=False):
        self._directory = directory
        self._user = user

        if init:
            self.git('init')

    @property
    def user(self):
        return self._user

    def git(self, *git_args):
        additional_args = [
            '-C', self._directory,
            '-c', f'user.name="{self._user.name}"',
            '-c', f'user.email="{self._user.email}"',
        ]
        all_args = additional_args + list(git_args)
        return git(*all_args)


def bypass_cred_scan_hook(repo):
    # This magic disables the CredScan hook.
    commit_message = "**DISABLE_SECRET_SCANNING**"
    repo.git('commit', '--allow-empty', '--message', commit_message)


def shallow_checkout(repo_url, dir_path, revision):
    mkdir_p(dir_path)

    repo = Repository(dir_path, init=True)
    repo.git('remote', 'add', 'origin', repo_url)
    repo.git('fetch', '--depth=1', 'origin', revision)
    repo.git('checkout', 'FETCH_HEAD')
