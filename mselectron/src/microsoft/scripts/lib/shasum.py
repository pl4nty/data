import hashlib
import os

import lib.filesystem as fs


class FormatMarker:
    ASTERISK = '*'  # binary
    SPACE = ' '  # text

    @staticmethod
    def by_name(marker_name):
        if marker_name == 'space':
            return FormatMarker.SPACE

        if marker_name == 'asterisk':
            return FormatMarker.ASTERISK

        raise Exception(f"invalid marker name '{marker_name}'")


class FileHasher:
    def __init__(self, file_path, root_dir=None):
        self._path = file_path
        self._root_dir = root_dir

    @staticmethod
    def _get_format_marker(is_binary, force_marker=None):
        if force_marker is not None:
            return FormatMarker.by_name(force_marker)

        marker = FormatMarker.ASTERISK if is_binary else FormatMarker.SPACE
        return marker

    def _get_relative_path(self):
        relative_path = self._path if self._root_dir is None \
            else os.path.relpath(self._path, self._root_dir)
        relative_path_with_forward_slashes = relative_path.replace(os.sep, '/')
        return relative_path_with_forward_slashes

    def get_hash(self, algorithm, as_binary=False, encoding='utf-8'):
        file_contents = fs.read_file(self._path,
                                     as_text=not as_binary,
                                     encoding=encoding)
        if not as_binary:
            file_contents = file_contents.encode(encoding)

        hasher = hashlib.new(algorithm)
        hasher.update(file_contents)
        return hasher.hexdigest()

    def get_formatted_hash(self, algorithm, as_binary=False,
                           format_marker=None, include_file_paths=True):
        """Create a string in the following format:
        "hashstring<space><format_marker>a/relative/file/path.txt\n"
        """
        pattern = "{hash_value} {format_marker}{file_path}\n"

        hash_value = self.get_hash(algorithm, as_binary)
        format_marker = FileHasher._get_format_marker(
            as_binary, force_marker=format_marker)
        if include_file_paths:
            file_path = self._get_relative_path()
        else:
            file_path = os.path.basename(self._path)

        result = pattern.format(**{
            'hash_value': hash_value,
            'file_path': file_path,
            'format_marker': format_marker,
        })
        return result


class FileListHasher:
    @staticmethod
    def from_directory(directory_path, recursive=False):
        files_paths = fs.get_all_files(directory_path, recursive)
        return FileListHasher(files_paths, root_dir=directory_path)

    def __init__(self, files_paths, root_dir=None):
        self._file_hashers = [FileHasher(f, root_dir) for f in files_paths]

    def get_formatted_hashes(self, algorithm, as_binary=False,
                             format_marker=None, include_file_paths=True):
        formatted_hashes = [file_hash.get_formatted_hash(
            algorithm, as_binary, format_marker, include_file_paths)
                            for file_hash in self._file_hashers]
        lines = ''.join(formatted_hashes)
        return lines
