import platform


class CanonicalArch:
    """Human friendly arch identifiers.
    The set intended to be used as expected values provided by a user,
    e.g. as script arguments.
    """
    ARM = 'arm'
    ARM64 = 'arm64'
    X64 = 'x64'
    X86 = 'x86'

    @staticmethod
    def get_all():
        return (
            CanonicalArch.ARM,
            CanonicalArch.ARM64,
            CanonicalArch.X64,
            CanonicalArch.X86,
        )

    @staticmethod
    def get_host_arch():
        machine = platform.machine().lower()
        if 'arm' in machine:
            return CanonicalArch.ARM
        if 'aarch64' in machine:
            return CanonicalArch.ARM64
        if 'x86_64' in machine:
            return CanonicalArch.X64
        if 'x86' in machine:
            return CanonicalArch.X86
        raise Exception('Unknown host CPU type')
