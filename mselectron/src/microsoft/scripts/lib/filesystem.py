from __future__ import print_function

import errno
import os
import shutil
import sys
import tempfile

from contextlib import contextmanager

from .canonical_platform import CanonicalPlatform


@contextmanager
def get_temp_folder(ignore_delete_errors=False):
    temp_folder = tempfile.mkdtemp()
    try:
        yield temp_folder
    finally:
        shutil.rmtree(temp_folder, ignore_errors=ignore_delete_errors)


def read_file(file_path, as_text=True, as_lines=False, encoding='utf-8'):
    if as_text:
        with open(file_path, mode='rt', encoding=encoding) as f:
            return f.readlines() if as_lines else f.read()
    else:
        with open(file_path, mode='rb') as f:
            return f.read()


def rename_file(dir_path, src, dst):
    src_path = os.path.join(dir_path, src)
    dst_path = os.path.join(dir_path, dst)
    os.rename(src_path, dst_path)


def print_file(file_path):
    file_contents = read_file(file_path)
    print(file_contents, end='')


def mkdir_p(path):
    """Simulates mkdir -p"""
    try:
        os.makedirs(path)
    except OSError as e:
        if e.errno == errno.EEXIST and os.path.isdir(path):
            pass
        else:
            raise


def mirror_files(source_dir, source_files,
                 destination_dir, destination_files=None,
                 use_hardlinks=False):
    """Mirrors selected files from one directory to another.
    Optionally changes path and name of every file with one-to-one mapping.
    By default copies the files, but can optionally use hardlinks.
    """

    use_destination_mapping = destination_files is not None

    if use_destination_mapping and len(source_files) != len(destination_files):
        raise Exception("number of destination files "
                        "must match the number of source files")

    for index, source_file_path in enumerate(source_files):
        norm_source_file_path = os.path.normpath(source_file_path)
        source_path = os.path.join(source_dir, norm_source_file_path)

        destination_file_path = (source_file_path
                                 if not use_destination_mapping
                                 else destination_files[index])
        norm_destination_file_path = os.path.normpath(destination_file_path)
        destination_path = os.path.join(destination_dir,
                                        norm_destination_file_path)

        mkdir_p(os.path.dirname(destination_path))

        if use_hardlinks and are_hardlinks_available():
            os.link(source_path, destination_path)
        else:
            shutil.copyfile(source_path, destination_path)


def are_hardlinks_available():
    platform = CanonicalPlatform.from_system()

    if platform in (CanonicalPlatform.LINUX, CanonicalPlatform.MAC):
        return True

    if platform == CanonicalPlatform.WINDOWS:
        # https://docs.python.org/3.2/library/os.html#os.link
        return sys.version_info >= (3, 2)

    return False


def exists(path, entity_type=None):
    if not os.path.exists(path):
        return False

    if entity_type == 'file' and not os.path.isfile(path):
        return False

    if entity_type == 'directory' and not os.path.isdir(path):
        return False

    return True


def touch(file_path):
    if exists(file_path, 'file'):
        return

    # Make sure all parent folders exist.
    parent_dir = os.path.dirname(file_path)
    mkdir_p(parent_dir)

    # Create an empty file.
    with open(file_path, mode='a', encoding='utf-8') as f:
        f.close()


def get_all_files(directory_path, recursive=False):
    if recursive:
        files = []
        for root, _, filenames in os.walk(directory_path):
            for file_path in filenames:
                full_file_path = os.path.join(root, file_path)
                files.append(full_file_path)
        return files

    return [child_path for child_path in os.listdir(directory_path)
        if os.path.isfile(child_path)]


def write_to_file(text, file_path, as_text=True, encoding='utf-8',
                  newline=None):
    touch(file_path)

    if as_text:
        with open(file_path, 'wt', newline=newline, encoding=encoding) as f:
            f.write(text)
    else:
        with open(file_path, 'wb', newline=newline) as f:
            f.write(text)


def append_to_file(text, file_path, encoding='utf-8',
                  newline=None):
    if not exists(file_path, entity_type='file'):
        raise FileNotFoundError(f"'{file_path}' not found")

    open_args = {
        'encoding': encoding,
        'mode': 'a',
        'newline': newline,
    }

    with open(file_path, **open_args) as f:
        f.write(text)


def for_every_line(dir_path):
    """Iterate over all lines of all files in a directory.
    Send a string back to the generator to replace the string.
    """
    files = get_all_files(dir_path, recursive=True)

    for file_path in files:
        lines = read_file(file_path, as_lines=True)
        changed_lines = []

        for line in lines:
            changed_line = yield line
            if changed_line is None:
                changed_line = line
            changed_lines.append(changed_line)

        changed_file_contents = ''.join(changed_lines)
        write_to_file(changed_file_contents, file_path, newline='\n')
