import copy

from .canonical_arch import CanonicalArch
from .canonical_platform import CanonicalPlatform


_SUPPORTED_PLATFORMS = [
  {'platform': CanonicalPlatform.LINUX, 'arch': CanonicalArch.ARM},
  {'platform': CanonicalPlatform.LINUX, 'arch': CanonicalArch.ARM64},
  {'platform': CanonicalPlatform.LINUX, 'arch': CanonicalArch.X64},
  {'platform': CanonicalPlatform.MAC, 'arch': CanonicalArch.ARM64},
  {'platform': CanonicalPlatform.MAC, 'arch': CanonicalArch.X64},
  {'platform': CanonicalPlatform.WINDOWS, 'arch': CanonicalArch.ARM64},
  {'platform': CanonicalPlatform.WINDOWS, 'arch': CanonicalArch.X64},
  {'platform': CanonicalPlatform.WINDOWS, 'arch': CanonicalArch.X86},
]


def get():
    return copy.deepcopy(_SUPPORTED_PLATFORMS)
