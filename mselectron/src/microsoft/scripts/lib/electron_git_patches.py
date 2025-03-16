#!/usr/bin/env python3

"""Tools to create, import, and export patches"""

from __future__ import annotations
from dataclasses import dataclass

import errno
import io
import json
import os
import re
import subprocess
import sys

UPSTREAM_HEAD = 'refs/patches/upstream-head'

PATCH_DIR_PREFIX = "Patch-Dir: "
PATCH_FILENAME_PREFIX = "Patch-Filename: "
PATCH_PREFIXES = (PATCH_DIR_PREFIX, PATCH_FILENAME_PREFIX)


class Patch:
    """Helper class for reading, writing, and applying patches"""
    dirname: str = ''
    basename: str = ''

    # The contents of the patch, e.g. from `git format-patch`.
    # NB: each line preserves the trailing CR / LF / CRLF
    # so they are passed unchanged into `git am --keep-cr`
    lines = []

    def __init__(self, dirname, basename, lines):
        self.dirname = dirname
        self.basename = basename
        self.lines = lines

    def __eq__(self, that) -> bool:
        return self.filename() == that.filename() and self.lines == that.lines

    def filename(self):
        """Return the filename where this patch should be saved"""
        return os.path.join(self.dirname, self.basename)

    def to_am_string(self) -> str:
        """Stringify the patch for use in `git am`.
           Injects dirname/basename metainfo into the commit message."""
        keys = ('diff -', '---')
        lines = list(self.lines)
        inject_idx = list(line.startswith(keys) for line in lines).index(True)
        lines[inject_idx:inject_idx] = [
            f"{PATCH_DIR_PREFIX}{self.dirname}\n",
            f"{PATCH_FILENAME_PREFIX}{self.basename}\n"
        ]
        return ''.join(lines)

    def save_to_file(self, filename=''):
        """Writes the patch to a file"""
        filename = filename or self.filename()
        with open(self.filename(), 'w', newline='\n', encoding='utf-8') as fout:
            content = ''.join(self.lines)
            if not content.endswith('\n'):
                content += '\n'
            fout.write(content)

    def append_to_patches_file(self):
        """Appends this patch to thet end of the `.patches` file"""
        patches_file = Patch.patches_file(self.dirname)
        with open(patches_file, 'a', newline='\n', encoding='utf-8') as out:
            out.write(self.basename + '\n')

    @staticmethod
    def from_commit(repo_dir: str, commit: str) -> Patch:
        """Read a patch from a repo via `git format-patch`.
           Extracts any metainfo injected by `to_am_string()`."""
        if not repo_dir:
            repo_dir = os.getcwd()

        git_attributes_file = os.path.join(
          os.path.dirname(os.path.realpath(__file__)),
          'electron.gitattributes'
        )

        args = [
            'git',
            '-C', repo_dir,
            '-c', f"core.attributesfile='${git_attributes_file}'",
            'format-patch',
            '--full-index',
            '--keep-subject',
            '--no-signature',
            '--no-stat',
            '--stdout',
            '--zero-commit',
            '-1',
            commit
        ]
        raw = subprocess.check_output(args, encoding='utf-8')
        if not raw:
            print("commit not found", file=sys.stderr)
            sys.exit(1)

        # extract the metainfo that we injected
        lines = raw.splitlines(True)
        dirname = Patch.__get_dirname(lines)
        basename = Patch.__get_basename(lines)
        Patch.__remove_patch_location(lines)

        return Patch(dirname=dirname, basename=basename, lines=lines)

    @staticmethod
    def from_file(filename: str) -> Patch:
        """Read a patch from the specified .patch file"""

        filename = os.path.abspath(filename)
        dirname = os.path.dirname(filename)
        basename = os.path.basename(filename)

        lines = []
        with open(filename, encoding='utf-8', mode='r', newline='') as fin:
            lines = fin.readlines()

        return Patch(dirname=dirname, basename=basename, lines=lines)

    @staticmethod
    def from_dir(dirname: str) -> list[Patch]:
        """Read a list of Patches from the specified patchdir"""
        patches_file = Patch.patches_file(dirname)
        with io.open(patches_file, encoding='utf-8') as fin:
            bases = fin.read().splitlines()
            filenames = [os.path.join(dirname, base) for base in bases]
            return [Patch.from_file(filename) for filename in filenames]

    @staticmethod
    def patches_file(dirname: str) -> str:
        """Return the directory's .patches filename"""
        return os.path.join(dirname, '.patches')

    @staticmethod
    def __munge_subject_to_basename(subject: str) -> str:
        """Derive a suitable filename from a commit's subject"""
        subject = subject.rstrip('\r\n')
        if subject.endswith('.patch'):
            subject = subject[:-6]
        subject = re.sub(r'[^A-Za-z0-9-]+', '_', subject).strip('_').lower()
        return subject + '.patch'

    @staticmethod
    def __get_basename(lines) -> str:
        """Return the basename of the file where patch should be written"""
        basename: str = ''
        for line in lines:
            key = PATCH_FILENAME_PREFIX
            if line.startswith(key):
                basename = line[len(key):].rstrip('\r\n')
                break

        # If no Patch-Filename: header, munge the subject.
        if not basename:
            key = 'Subject: '
            for line in lines:
                if line.startswith(key):
                    subject = line[len(key):].rstrip('\r\n')
                    basename = Patch.__munge_subject_to_basename(subject)
                    break

        return basename.rstrip('\r\n')

    @staticmethod
    def __get_dirname(lines) -> str:
        """Return the dirname of the file where the patch should be written"""
        key = PATCH_DIR_PREFIX
        for line in lines:
            if line.startswith(key):
                return line[len(key):].rstrip('\r\n')
        return ''

    @staticmethod
    def __remove_patch_location(lines):
        """Strip out the patch location lines from a patch's message body"""
        lines_to_remove = []
        for idx, line in enumerate(lines):
            if line.startswith(PATCH_PREFIXES):
                lines_to_remove.extend((idx, idx + 1))
            if line.startswith('diff --git'):
                break
        for idx in reversed(sorted(set(lines_to_remove))):
            del lines[idx]
        return lines


@dataclass
class GitAmOpts:
    """Options for git_am()"""
    def __init__(self):
        self.committer_email = ''
        self.committer_name = ''
        self.directory = ''
        self.exclude = []
        self.keep_cr = True
        self.threeway = False


def git_am(repo, patch_data, opts=GitAmOpts()):
    """Appply patches to a git repository"""
    args = []
    if opts.threeway:
        args += ['--3way']

    if opts.directory:
        args += ['--directory', opts.directory]

    if opts.exclude:
        for path_pattern in opts.exclude:
            args += ['--exclude', path_pattern]

    if opts.keep_cr:
        # Keep the CR of CRLF in case any patches
        # target files with Windows line endings.
        args += ['--keep-cr']

    root_args = [
      '-C', repo,
      '-c', 'commit.gpgsign=false'
    ]

    if opts.committer_name:
        root_args += ['-c', 'user.name=' + opts.committer_name]

    if opts.committer_email:
        root_args += ['-c', 'user.email=' + opts.committer_email]

    command = ['git'] + root_args + ['am'] + args
    with subprocess.Popen(command, stdin=subprocess.PIPE) as proc:
        proc.communicate(patch_data.encode('utf-8'))
        if proc.returncode != 0:
            raise RuntimeError(f"Command {command} returned {proc.returncode}")


def import_patches(repo: str,
                   patch_data: str,
                   opts: GitAmOpts = GitAmOpts(),
                   ref: str = UPSTREAM_HEAD):
    """same as am(), but we save the upstream HEAD so we can refer to
    it when we later export patches"""
    subprocess.check_call(['git', '-C', repo, 'update-ref', ref, 'HEAD'])
    git_am(repo=repo, patch_data=patch_data, opts=opts)


def _guess_base_commit(repo: str, ref: str) -> str:
    """Guess which commit the patches might be based on"""
    # try to get the commit for `ref`
    args = ['git', '-C', repo, 'rev-parse', '--verify', ref]
    return subprocess.check_output(args, encoding='utf-8').strip()


def _get_commit_hashes_since(repo: str, ref: str):
    """Get a list of commit hashes since the specified reference"""
    args = ['git', '-C', repo, 'rev-list', f"{ref}.."]
    commits = subprocess.check_output(args, encoding='utf-8').splitlines()
    # return them in order of first commit -> latest commit
    commits.reverse()
    return commits


def __export_patches_dry_run(patches_by_dirname):
    """Test that the specified patches match the ones on disk"""
    bad = {}
    for dirname, patches in patches_by_dirname.items():
        for patch in patches:
            if patch != Patch.from_file(patch.filename()):
                bad.setdefault(dirname, []).append(patch.basename)

    if len(bad) > 0:
        for dirname, basenames in bad.items():
            for basename in basenames:
                print(f"{dirname}/{basename} needs to be updated",
                      file=sys.stderr)
        sys.exit(1)


def export_patches(repo: str,
                   patch_range: str = '',
                   ref: str = UPSTREAM_HEAD,
                   dry_run: bool = False):
    """Saves the specified patch data to disk in a patch dir"""
    if not os.path.exists(repo):
        sys.stderr.write(f"Skipping non-existent repo '{repo}'.\n")
        return

    start = patch_range or _guess_base_commit(repo, ref)

    # A map of patch_dir -> list of [patch, patch_basename] pairs to save
    patches_by_dirname = {}
    for commit in _get_commit_hashes_since(repo, start):
        patch = Patch.from_commit(repo, commit)
        if not patch.dirname:
            sys.stderr.write(
                f"Unknown patch {commit} in {repo}. Export it manually.")
            sys.exit(1)
        patches_by_dirname.setdefault(patch.dirname, []).append(patch)

    if dry_run:
        __export_patches_dry_run(patches_by_dirname)
        return

    # Save 'em
    print(f"exporting {repo}")
    for patch_dir, patches in patches_by_dirname.items():
        print(f"  {len(patches)} patches in {patch_dir}")

        # ensure `patch_dir` exists
        try:
            os.mkdir(patch_dir)
        except OSError:
            pass

        # Remove old patch files so that deleted commits are correctly
        # reflected in the patch files (as a removed file)
        os.remove(Patch.patches_file(patch_dir))
        for basename in os.listdir(patch_dir):
            if basename.endswith('.patch'):
                os.remove(os.path.join(patch_dir, basename))

        # Save the patches in this dir
        for patch in patches:
            patch.append_to_patches_file()
            patch.save_to_file()


def is_config_json(string: str):
    """Argparse helper to see if a command-line arg a patches config file"""
    # is it a config.json file?
    if os.path.isfile(string) and string.endswith('config.json'):
        return string
    raise OSError(errno.EINVAL, string)


def get_repo_patch_dirs(project_root_dir: str, config_json_files):
    """Returns an object of { repo: [patch_dir_1, patch_dir_2, ...] }"""

    if isinstance(config_json_files, str):
        config_json_files = [config_json_files]

    repo_patch_dirs = {}
    for config_json in config_json_files:
        # parse the config.json files' json contents
        targets = []
        config_json = os.path.join(project_root_dir, config_json)
        with open(config_json, encoding='utf-8') as fin:
            targets = json.load(fin)

        for target in targets:
            repo = target.get('repo')
            patch_dir = target.get('patch_dir')
            repo_path = os.path.join(project_root_dir, repo)
            if not repo or not os.path.exists(repo_path):
                print(f"Bad repo '{repo}' in '{config_json}'", file=sys.stderr)
                continue
            repo_patch_dirs.setdefault(repo, []).append(patch_dir)

    return repo_patch_dirs


def get_patch_data(project_root_dir: str, patch_dirs) -> str:
    """Returns `patch_dirs` patch contents as a single string for `git am`"""
    if isinstance(patch_dirs, str):
        patch_dirs = [patch_dirs]

    patches = []
    for patch_dir in patch_dirs:
        absolute_patch_dir = os.path.join(project_root_dir, patch_dir)
        patches.extend(Patch.from_dir(absolute_patch_dir))
    return '\n'.join([patch.to_am_string() for patch in patches])


__all__ = [
    'GitAmOpts',
    'Patch',
    'export_patches',
    'get_patch_data',
    'get_repo_patch_dirs',
    'git_am',
    'import_patches',
    'is_config_json',
]
