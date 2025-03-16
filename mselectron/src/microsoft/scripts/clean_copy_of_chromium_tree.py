#!/usr/bin/env python3

import glob
import argparse
import os
from pathlib import Path
import shutil

from lib.canonical_platform import CanonicalPlatform
import lib.filesystem as fs


def parse_args():
    parser = argparse.ArgumentParser(
        description="Create a clean copy of a Chromium tree")
    parser.add_argument('--chromium-path',
                        type=os.path.abspath, required=True,
                        help="Chromium checkout path")
    parser.add_argument('--copy-path', required=True,
                        type=os.path.abspath,
                        help="path to a clean copy folder (must not exist)")
    parser.add_argument('-p', '--platform', required=True,
                        choices=CanonicalPlatform.get_all())
    return parser.parse_args()


def main():
    script_args = parse_args()
    clean_copy(script_args.chromium_path,
               script_args.copy_path,
               script_args.platform)


def path_size(filename):
    if not os.path.isdir(filename):
        return os.path.getsize(filename)

    n_bytes = 0
    for root, _, files in os.walk(filename):
        for name in files:
            try:
                n_bytes += os.path.getsize(os.path.join(root, name))
            # broken symlinks, e.g. in a sysroot, can raise this
            except FileNotFoundError as e:
                print(e)
    return n_bytes


def path_remove(path):
    for filename in glob.glob(str(path)):
        print(f"Deleting '{filename}', {path_size(filename):,} bytes")
        if os.path.isdir(filename):
            shutil.rmtree(filename)
        else:
            os.remove(filename)


def clean_copy(chromium_path, copy_path, platform):
    # Do not include some files and folders into the copy.
    ignore = shutil.ignore_patterns(
        '.git',
        '.gitignore',

        # The full path is "third_party/apache-windows-arm64".
        # This could have been deleted later, just like everything else,
        # but it can't be: "PermissionError: [WinError 5] Access is denied".
        # The folder name is specific enough to use it as an ignore pattern.
        'apache-windows-arm64',
    )
    shutil.copytree(chromium_path, copy_path,
                    ignore=ignore, symlinks=True)

    # Delete some unused files and folders.
    # This could have been achieved by ignoring them
    # during copying but that would be too complex.
    src = Path(copy_path)
    tp = 'third_party'  # To make lines below shorter.
    to_remove = [
        # omit some large pieces that we don't use
        src/'android_webview',
        src/'chrome'/'test'/'data'/'android',
        src/'chrome'/'test'/'data'/'extensions',
        src/'chrome'/'test'/'data'/'import',
        src/'chrome'/'test'/'data'/'perf',
        src/'chrome'/'test'/'data'/'safe_browsing',
        src/'chrome'/'test'/'data'/'xr',
        src/'docs',
        src/'ios',
        src/'testing'/'libfuzzer'/'fuzzers'/'wasm_corpus',
        src/'v8'/'test'/'mjsunit'/'asm',
        src/'v8'/'test'/'mjsunit'/'regress',
        src/'v8'/'test'/'mjsunit'/'wasm',
        src/tp/'angle'/tp/'VK-GL-CTS'/'src'/'android',
        src/tp/'blink'/'perf_tests',
        src/tp/'blink'/'web_tests',
        src/tp/'boringssl'/'src'/tp/'wycheproof_testvectors',
        src/tp/'catapult'/'tracing'/'test_data',
        src/tp/'dawn'/'test',
        src/tp/'dawn'/tp/'dxc'/'test',
        src/tp/'expat'/'src'/'testdata'/'largefiles',
        src/tp/'harfbuzz-ng'/'src'/'test',
        src/tp/'jdk'/'current',
        src/tp/'instrumented_libs'/'binaries',
        src/tp/'skia'/'tests',
        src/tp/'swiftshader'/'tests'/'regres'/'testlists',
        src/tp/'swiftshader'/tp/'llvm-16.0',
        src/tp/'test_fonts'/'test_fonts',

        # pylint: disable=line-too-long
        # omit files that trigger the scanner's PemPrivateKey detector
        src/'chrome'/'browser'/'ash'/'arc'/'net'/'cert_manager_impl_unittest.cc',  # noqa: E501
        src/'chrome'/'test'/'base'/'chromeos'/'crosier'/'adb_helper.cc',
        src/'chrome'/'test'/'data'/'chromedriver',
        src/'chrome'/'test'/'data'/'chromeos'/'3p_diagnostics',
        src/'chrome'/'test'/'data'/'chromeos'/'app_mode'/'apps_and_extensions',  # noqa: E501
        src/'chrome'/'test'/'data'/'policy',
        src/'chromeos'/'components'/'test'/'data'/'onc',
        src/'components'/'subresource_filter'/'core'/'common'/'perftests'/'data',  # noqa: E501
        src/'components'/'test'/'data'/'autofill',
        src/'components'/'test'/'data'/'media_router',
        src/'components'/'test'/'data'/'update_client'/'ihfokbkgjpifnbbojhneepfflplebdkc'/'ihfokbkgjpifnbbojhneepfflplebdkc.pem',  # noqa: E501
        src/'components'/'test'/'data'/'update_client'/'jebgalgnebhfojomionfpkfelancnnkf.pem',  # noqa: E501
        src/'components'/'test'/'data'/'web_package',
        src/'content'/'test'/'data',
        src/'extensions'/'common'/'file_util_unittest.cc',
        src/'extensions'/'test'/'data',
        src/'net'/'data'/'cert_issuer_source_aia_unittest',
        src/'net'/'data'/'cert_issuer_source_static_unittest',
        src/'net'/'data'/'fuzzer_data',
        src/'net'/'data'/'ov_name_constraints'/'keys'/'*.key',
        src/'net'/'data'/'ssl'/'certificates'/'*.key',
        src/'net'/'data'/'ssl'/'certificates'/'*.p12',
        src/'net'/'data'/'ssl'/'certificates'/'*.pem',
        src/'net'/'data'/'verify_certificate_chain_unittest',
        src/'net'/tp/'quiche'/'src'/'quiche'/'quic'/'test_tools'/'test_certificates.cc',  # noqa: E501
        src/tp/'blink'/'renderer'/'bindings'/'modules'/'v8'/'serialization'/'v8_script_value_serializer_for_modules_test.cc',  # noqa: E501
        src/tp/'blink'/'renderer'/'core'/'css'/'perftest_data'/'search.json',  # noqa: E501
        src/tp/'blink'/'tools'/'apache_config'/'webkit-httpd.pem',
        src/tp/'blink'/'tools'/'print_stale_test_expectations_entries.py',
        src/tp/'boringssl'/'src'/'crypto'/'dsa'/'dsa_test.cc',
        src/tp/'boringssl'/'src'/'crypto'/'pem'/'pem_test.cc',
        src/tp/'boringssl'/'src'/'crypto'/'pkcs7'/'pkcs7_test.cc',
        src/tp/'boringssl'/'src'/'crypto'/'x509'/'test',
        src/tp/'boringssl'/'src'/'crypto'/'x509'/'x509_test.cc',
        src/tp/'boringssl'/'src'/'pki'/'testdata',
        src/tp/'boringssl'/'src'/'ssl'/'ssl_test.cc',
        src/tp/'boringssl'/'src'/'ssl'/'test'/'runner'/'*.pem',
        src/tp/'catapult'/'telemetry'/'third_party'/'chromite'/'ssh_keys'/'testing_rsa',  # noqa: E501
        src/tp/'catapult'/tp/'gsutil'/'gslib'/'gcs_json_api.py',
        src/tp/'catapult'/tp/'gsutil'/'gslib'/'iamcredentials_api.py',
        src/tp/'catapult'/tp/'gsutil'/'gslib'/'kms_api.py',
        src/tp/'catapult'/tp/'gsutil'/'gslib'/'pubsub_api.py',
        src/tp/'catapult'/tp/'gsutil'/'gslib'/'tests',
        src/tp/'catapult'/tp/'gsutil'/'gslib'/'vendored'/'boto'/'tests',
        src/tp/'catapult'/tp/'gsutil'/'gslib'/'vendored'/'oauth2client'/'tests',  # noqa: E501
        src/tp/'catapult'/tp/'gsutil'/tp/'google-auth-library-python',
        src/tp/'catapult'/tp/'gsutil'/tp/'httplib2'/'tests',
        src/tp/'catapult'/tp/'gsutil'/tp/'rsa'/'tests',
        src/tp/'catapult'/tp/'gsutil'/tp/'urllib3'/'dummyserver'/'certs',  # noqa: E501
        src/tp/'catapult'/tp/'polymer'/'components'/'app-route'/'demo'/'youtube-demo',  # noqa: E501
    ]
    if platform == CanonicalPlatform.LINUX:
        to_remove += [
            src/'build'/'linux'/'debian_bullseye_amd64-sysroot',
            src/'build'/'linux'/'debian_bullseye_i386-sysroot',
            src/tp/'apache-linux',
        ]
    if platform == CanonicalPlatform.MAC:
        to_remove += [
            src/tp/'apache-mac',
            src/tp/'apache-mac-arm64',
        ]
    for path in to_remove:
        try:
            path_remove(path)
        # not every directory exists in every Chromium version,
        # so fail gracefully if it's not there
        except FileNotFoundError as e:
            print(e)

    # We don't want DEPS to be processed by gclient.
    # It's OK to rename only the top-level file.
    fs.rename_file(copy_path,
                   src='DEPS',
                   dst='DEPS.disabled')


if __name__ == '__main__':
    main()
