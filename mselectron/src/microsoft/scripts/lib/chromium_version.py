"""
Chromium Version Numbers
https://www.chromium.org/developers/version-numbers

A Chromium version, e.g. "76.0.3809.37", consists of four numbers
"major" (76), "minor" (0), "build" (3809), and "patch" (37),
divided by dots.
"""

import bisect
import re


class ChromiumVersion:
    def __init__(self, version_string):
        if not ChromiumVersion.is_version_string_valid(version_string):
            message = f"invalid format of a Chromium version '{version_string}'"
            raise Exception(message)

        self._major, self._minor, self._build, self._patch = \
            ChromiumVersion._parse_version_string(version_string)

    def __str__(self):
        return f"{self.major}.{self.minor}.{self.build}.{self.patch}"

    def __eq__(self, other):
        return str(self) == str(other)

    def __lt__(self, other):
        if self.major != other.major:
            return self.major < other.major

        if self.minor != other.minor:
            return self.minor < other.minor

        if self.build != other.build:
            return self.build < other.build

        return self.patch < other.patch

    @property
    def major(self):
        return self._major

    @property
    def minor(self):
        return self._minor

    @property
    def build(self):
        return self._build

    @property
    def patch(self):
        return self._patch

    def get_closest_parent(self, versions):
        return _choose_closest_predecessor_value(self, versions)

    @staticmethod
    def is_version_string_valid(version_string):
        pattern = re.compile("^[0-9]+.[0-9]+.[0-9]+.[0-9]+$")
        match = pattern.match(version_string)
        is_valid = match is not None
        return is_valid

    @staticmethod
    def _parse_version_string(version_string):
        return map(int, version_string.split('.'))


class ChromiumVersionWithSuffix(ChromiumVersion):
    default_suffix_separator = '-'

    def __init__(self, version_string, suffix,
                 suffix_separator=default_suffix_separator):
        self._suffix = suffix
        self._suffix_separator = suffix_separator
        super().__init__(version_string)

    def __str__(self):
        version_string = super().__str__()
        return version_string + self._suffix_separator + self._suffix

    @staticmethod
    def parse(version_string, suffix_separator=default_suffix_separator):
        version_string, suffix = version_string.split(suffix_separator)
        return ChromiumVersionWithSuffix(version_string,
                                         suffix=suffix,
                                         suffix_separator=suffix_separator)


def _choose_closest_predecessor_value(value, values):
    # Insert the value in the sorted list of all values,
    # while keeping the list sorted.
    values = sorted(values)
    bisect.insort(values, value)

    value_index = values.index(value)
    closest_predecessor_index = value_index - 1

    closest_predecessor = (None
                           if closest_predecessor_index == -1
                           else values[closest_predecessor_index])

    return closest_predecessor
