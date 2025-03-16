import os

from .project_paths import REPO_ROOT_DIR


class ElectronFlavour:
    ELECTRON = 'electron'
    VSCODE = 'vscode'

    @staticmethod
    def get_all():
        return (
            ElectronFlavour.ELECTRON,
            ElectronFlavour.VSCODE,
        )

    @staticmethod
    def get_description(flavour):
        if flavour == ElectronFlavour.ELECTRON:
            return "With App Center support; has no FFmpeg codecs."
        if flavour == ElectronFlavour.VSCODE:
            return "Electron variant tailored for Visual Studio Code."
        raise Exception(f"Unexpected flavour '{flavour}'")


class FFmpegFlavour:
    MAKECODE = 'makecode'
    MEDIA = 'media'
    MTRWDGJ = 'mtrwdgj'
    SLIM = 'slim'
    STORAGEEXPLORER = 'storageexplorer'

    @staticmethod
    def get_all():
        return (
            FFmpegFlavour.MAKECODE,
            FFmpegFlavour.MEDIA,
            FFmpegFlavour.MTRWDGJ,
            FFmpegFlavour.SLIM,
            FFmpegFlavour.STORAGEEXPLORER,
        )

    @staticmethod
    def get_config_path(flavour):
        return os.path.join(REPO_ROOT_DIR,
                            'build',
                            'ffmpeg',
                            f'{flavour}.args.gni')

    @staticmethod
    def get_description(flavour):
        if flavour == FFmpegFlavour.MAKECODE:
            return "Custom FFmpeg for the MakeCode app."
        if flavour == FFmpegFlavour.MEDIA:
            return "FFmpeg with the same media support as Google Chrome."
        if flavour == FFmpegFlavour.MTRWDGJ:
            return "Custom FFmpeg for the MTRW-DGJ app."
        if flavour == FFmpegFlavour.SLIM:
            return "Dummy FFmpeg that can't play any media."
        if flavour == FFmpegFlavour.STORAGEEXPLORER:
            return "Custom FFmpeg for the StorageExplorer app."
        raise Exception(f"Unexpected flavour '{flavour}'")
