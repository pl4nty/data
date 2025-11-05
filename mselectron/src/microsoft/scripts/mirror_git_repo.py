#!/usr/bin/env python3

"""
Take a repo and push it somewhere else.

Also optionally rewrites some commits before pushing. This is to avoid
problematic commits from 3rd party repos, e.g. being rejected due to a
false negative security scanner test.
"""

import argparse
import json
import os
from dataclasses import dataclass
from typing import Callable
import lib.filesystem as fs
from lib.git import Repository

SOURCE = 'upstream'
SCRATCH = 'scratch'
TARGET = 'downstream'


@dataclass
class Settings:
    """Holds the settings loaded from `config.json`"""
    def __init__(self, filename):
        with open(filename, encoding='utf8') as f:
            config = json.load(f)
        branches_object = config.get('branches', {})
        tags_object = config.get('tags', {})
        self.branches = branches_object.get('include', [])
        self.branches_force_push = branches_object.get('force_push', False)
        self.tag_patterns = tags_object.get('include', [])
        self.tags_force_push = tags_object.get('force_push', False)
        self.commits = config.get('patches', [])
        self.source = config['from']
        self.target = config['to']


def validate_file(f):
    """Raise an exception if |f| is not a readable file"""
    if not os.access(f, os.R_OK):
        raise argparse.ArgumentTypeError(f'{f} is not readable')
    return f


def parse_args():
    """Parse the command-line args"""
    parser = argparse.ArgumentParser(description="Mirror a Git repo")

    parser.add_argument('-c', '--config', dest='config_file',
                        type=validate_file, required=True,
                        help="a path to a config file in JSON format",
                        metavar="FILE")

    return parser.parse_args()


def main():
    """Main function."""
    script_args = parse_args()
    settings = Settings(script_args.config_file)
    patchdir = os.path.abspath(os.path.dirname(script_args.config_file))

    with fs.get_temp_folder() as temp_folder:
        repo = Repository(temp_folder, init=True)
        mirror_git_repo(repo=repo, settings=settings, patchdir=patchdir)


def mirror_git_repo(repo: Repository, settings: Settings, patchdir: str):
    """Take a repo and push it somewhere else."""

    # Add the |settings.source| & fetch and track the branches we want
    fetch_source(repo=repo, branches=settings.branches, url=settings.source)

    # Get a list of tags that match our search patterns
    tags = repo.git('tag', '--list', *settings.tag_patterns).splitlines()

    # Get a list of .patch files in |patchdir|
    patches = [f for f in os.listdir(patchdir) if f.endswith('.patch')]

    # Rewrite any commits that need it.
    # Keep track of which branches and tags get rewritten.
    rewritten_branches = set()
    rewritten_tags = set()
    for commit in settings.commits:
        # Find the .patch file that matches this commit.
        # The naming scheme is f'{hash}_descriptive_text.patch'
        patch_basename = next(f for f in patches if f.startswith(commit))
        patch_filename = os.path.join(patchdir, patch_basename)
        validate_file(patch_filename)
        changed_branches, changed_tags = replace_commit(
            branches=settings.branches, commit=commit,
            patch_filename=patch_filename, repo=repo, tags=tags)
        rewritten_branches.update(changed_branches)
        rewritten_tags.update(changed_tags)

    # Push the changes to |settings.target|
    repo.git('remote', 'add', TARGET, settings.target)

    # Pull in the target repo main branch to include changes not in upstream
    if 'main' in settings.branches:
        repo.git('pull', TARGET, 'main')

    # If not-main branch exists, do the same and make it the default branch
    if 'not-main' in settings.branches:
        repo.git('pull', '--rebase', TARGET, 'not-main')
        repo.git('remote', 'set-head', TARGET, 'not-main')

    push_refs(
        all_refs=set(settings.branches),
        changed_refs=rewritten_branches,
        force_all=settings.branches_force_push,
        make_refspec=lambda s: f'{s}:refs/heads/{s}',  # noqa: E231
        repo=repo,
    )
    push_refs(
        all_refs=set(tags),
        changed_refs=rewritten_tags,
        force_all=settings.tags_force_push,
        make_refspec=lambda s: f'refs/tags/{s}:refs/tags/{s}',  # noqa: E231
        repo=repo,
    )


def fetch_source(branches: list[str], url: str, repo: Repository):
    """Add a remote and fetch the branches we want."""
    repo.git('remote', 'add', SOURCE, url)
    # Strip 'not-' prefix for corresponding remote branch names
    fetch_branches = [branch.removeprefix('not-') for branch in branches]
    repo.git(*['fetch', '--tags', SOURCE, *fetch_branches])
    for branch in branches:
        if branch.startswith('not-'):
            remote_branch = branch.removeprefix('not-')
            local_branch = branch
            # Check if local branch exists
            existing_branches = repo.git('branch', '--list', local_branch).splitlines()
            if existing_branches:
                repo.git('checkout', local_branch)
                repo.git(
                    'branch', '--set-upstream-to', f'{SOURCE}/{remote_branch}', local_branch
                )
            else:
                repo.git(
                    'checkout', '--track', '-b', local_branch, f'{SOURCE}/{remote_branch}'
                )
        else:
            repo.git('checkout', '--track', f'{SOURCE}/{branch}')

def replace_commit(
    branches: list[str],
    commit: str,
    patch_filename: str,
    repo: Repository,
    tags: list[str],
):
    """Overwrite |commit| by patching it with |patch_filename|.
       Rewrite all the affected |branches| and |tags|."""
    # make a scratch branch with everything up through |commit|
    repo.git('switch', '--create', SCRATCH, commit)

    # apply the patch and overwrite |commit|
    repo.git('apply', patch_filename)
    repo.git('add', '.')
    repo.git('commit', '--amend', '--no-edit', '--no-gpg-sign')

    # rewrite the branches that contain |commit|
    branches_to_rebase = repo.git('branch',
                                  '--contains', commit,
                                  '--format=%(refname:short)',
                                  '--list', *branches).splitlines()
    for branch in branches_to_rebase:
        repo.git('rebase', '--no-gpg-sign', '--onto', SCRATCH, commit, branch)

    # rewrite the tags that contain |commit|
    tags_to_rebase = repo.git('tag',
                              '--contains', commit,
                              '--list', *tags).splitlines()
    for tag in tags_to_rebase:
        repo.git('checkout', tag)
        repo.git('rebase', '--no-gpg-sign', '--onto', SCRATCH, commit)
        repo.git('tag', '--force', tag)

    # cleanup
    repo.git('branch', '--delete', '--force', SCRATCH)

    return set(branches_to_rebase), set(tags_to_rebase)


def push_refs(
    all_refs: set[str],
    changed_refs: set[str],
    force_all: bool,
    make_refspec: Callable[[str], str],
    repo: Repository,
):
    """Push refs to |settings.target|. Force as needed"""

    # If |force| is set, force all of the refs.
    # Otherwise, only force the ones that were rewritten.
    if force_all:
        forced = all_refs
        unforced = set()
    else:
        forced = changed_refs
        unforced = all_refs.difference(changed_refs)

    if forced:
        refspecs = [make_refspec(ref) for ref in forced]
        repo.git('push', '--force', TARGET, *refspecs)

    if unforced:
        refspecs = [make_refspec(ref) for ref in unforced]
        repo.git('push', '--no-force', TARGET, *refspecs)


if __name__ == '__main__':
    main()
