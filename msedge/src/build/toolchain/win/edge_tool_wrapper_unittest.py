#!/usr/bin/env python3
# Copyright (C) Microsoft Corporation. All rights reserved.

import os
import sys
import tempfile
import unittest

import tool_wrapper


@unittest.skipUnless(sys.platform == 'win32', 'Windows tool wrapper tests')
class ToolWrapperTest(unittest.TestCase):

    def test_collects_linker_inputs_and_creates_placeholders(self):
        with tempfile.TemporaryDirectory() as temp_dir:
            rsp_path = os.path.join(temp_dir, 'link.rsp')
            nested_rsp_path = os.path.join(temp_dir, 'nested.rsp')
            output_path = os.path.join(
                temp_dir, 'inputs' + tool_wrapper.EDGE_LINKER_INPUTS_SUFFIX
            )
            implib_path = output_path + '.lib'
            pdb_path = output_path + '.pdb'
            object_path = os.path.join(temp_dir, 'object with spaces.obj')
            resource_path = os.path.join(temp_dir, 'resources.res')
            whole_archive_path = os.path.join(temp_dir, 'whole archive.lib')
            with open(nested_rsp_path, 'w', encoding='utf-8') as nested_rsp:
                nested_rsp.write(f'"/WHOLEARCHIVE:{whole_archive_path}"')
            with open(rsp_path, 'w', encoding='utf-8') as rsp:
                rsp.write(
                    f'"{object_path}" "{resource_path}" user32.lib '
                    f'--collect-inputs-only '
                    f'/DLL "@{nested_rsp_path}"'
                )

            handled = tool_wrapper.WinTool()._EdgeHandleCollectInputsOnly(
                (
                    'lld-link.exe',
                    f'/OUT:{output_path}',
                    f'/IMPLIB:{implib_path}',
                    f'/PDB:{pdb_path}',
                    f'@{rsp_path}',
                )
            )

            self.assertTrue(handled)
            self.assertTrue(os.path.exists(implib_path))
            self.assertTrue(os.path.exists(pdb_path))
            with open(output_path, encoding='utf-8') as output:
                self.assertEqual(
                    [
                        tool_wrapper.EDGE_LINKER_INPUTS_HEADER,
                        object_path,
                        resource_path,
                        whole_archive_path,
                    ],
                    output.read().splitlines(),
                )

    def test_ignores_regular_link(self):
        self.assertFalse(
            tool_wrapper.WinTool()._EdgeHandleCollectInputsOnly(
                ('lld-link.exe', '/OUT:browser.dll', '@missing.rsp')
            )
        )

    def test_rejects_missing_manifest_response_file(self):
        with self.assertRaises(FileNotFoundError):
            tool_wrapper.WinTool()._EdgeHandleCollectInputsOnly(
                (
                    'lld-link.exe',
                    '/OUT:browser' + tool_wrapper.EDGE_LINKER_INPUTS_SUFFIX,
                    '@missing.rsp',
                )
            )

    def test_requires_exact_collect_inputs_flag(self):
        with tempfile.TemporaryDirectory() as temp_dir:
            rsp_path = os.path.join(temp_dir, 'link.rsp')
            with open(rsp_path, 'w', encoding='utf-8') as rsp:
                rsp.write('obj/--collect-inputs-only.obj')
            with self.assertRaisesRegex(
                ValueError, 'Missing --collect-inputs-only'
            ):
                tool_wrapper.WinTool()._EdgeHandleCollectInputsOnly(
                    (
                        'lld-link.exe',
                        '/OUT:browser'
                        + tool_wrapper.EDGE_LINKER_INPUTS_SUFFIX,
                        f'@{rsp_path}',
                    )
                )

    def test_rejects_recursive_response_files(self):
        with tempfile.TemporaryDirectory() as temp_dir:
            rsp_path = os.path.join(temp_dir, 'link.rsp')
            with open(rsp_path, 'w', encoding='utf-8') as rsp:
                rsp.write(f'--collect-inputs-only "@{rsp_path}"')
            with self.assertRaisesRegex(ValueError, 'Recursive linker response'):
                tool_wrapper.WinTool()._EdgeHandleCollectInputsOnly(
                    (
                        'lld-link.exe',
                        '/OUT:browser'
                        + tool_wrapper.EDGE_LINKER_INPUTS_SUFFIX,
                        f'@{rsp_path}',
                    )
                )

    def test_reads_utf16_response_file(self):
        with tempfile.TemporaryDirectory() as temp_dir:
            rsp_path = os.path.join(temp_dir, 'link.rsp')
            output_path = os.path.join(
                temp_dir, 'inputs' + tool_wrapper.EDGE_LINKER_INPUTS_SUFFIX
            )
            object_path = os.path.join(temp_dir, 'localized object.obj')
            with open(rsp_path, 'w', encoding='utf-16') as rsp:
                rsp.write(f'"{object_path}" --collect-inputs-only')

            self.assertTrue(
                tool_wrapper.WinTool()._EdgeHandleCollectInputsOnly(
                    (
                        'lld-link.exe',
                        f'-OUT:"{output_path}"',
                        f'@{rsp_path}',
                    )
                )
            )

    def test_uses_windows_response_file_quoting(self):
        self.assertEqual(
            [r'C:\path with spaces\object.obj', 'plain.lib'],
            tool_wrapper.WinTool()._EdgeSplitWindowsCommandLine(
                r'"C:\path with spaces\object.obj" plain.lib'
            ),
        )

    def test_creates_placeholder_parent_directories(self):
        with tempfile.TemporaryDirectory() as temp_dir:
            rsp_path = os.path.join(temp_dir, 'link.rsp')
            output_path = os.path.join(
                temp_dir, 'inputs' + tool_wrapper.EDGE_LINKER_INPUTS_SUFFIX
            )
            implib_path = os.path.join(temp_dir, 'lib', 'inputs.lib')
            pdb_path = os.path.join(temp_dir, 'symbols', 'inputs.pdb')
            with open(rsp_path, 'w', encoding='utf-8') as rsp:
                rsp.write('--collect-inputs-only')

            self.assertTrue(
                tool_wrapper.WinTool()._EdgeHandleCollectInputsOnly(
                    (
                        'lld-link.exe',
                        f'/OUT:{output_path}',
                        f'/IMPLIB:{implib_path}',
                        f'/PDB:{pdb_path}',
                        f'@{rsp_path}',
                    )
                )
            )
            self.assertTrue(os.path.exists(implib_path))
            self.assertTrue(os.path.exists(pdb_path))

    def test_resolves_bare_library_from_environment(self):
        with tempfile.TemporaryDirectory(dir=os.getcwd()) as temp_dir:
            library_path = os.path.join(temp_dir, 'resolved.lib')
            with open(library_path, 'wb'):
                pass
            self.assertEqual(
                os.path.relpath(library_path),
                tool_wrapper.WinTool()._EdgeResolveLibrary(
                    'resolved.lib', {'LIB': temp_dir}, []
                ),
            )

    def test_collects_every_linker_input_form(self):
        with tempfile.TemporaryDirectory(dir=os.getcwd()) as temp_dir:
            rsp_path = os.path.join(temp_dir, 'link.rsp')
            output_path = os.path.join(
                temp_dir, 'inputs' + tool_wrapper.EDGE_LINKER_INPUTS_SUFFIX
            )
            library_dir = os.path.join(temp_dir, 'libraries')
            os.makedirs(library_dir)
            direct_inputs = [
                os.path.join(temp_dir, 'marker.obj'),
                os.path.join(temp_dir, 'marker.o'),
                os.path.join(temp_dir, 'markers.a'),
                os.path.join(temp_dir, 'markers.rlib'),
                os.path.join(temp_dir, 'resources.res'),
            ]
            whole_archive_path = os.path.join(temp_dir, 'whole.lib')
            default_library_path = os.path.join(library_dir, 'default.lib')
            for input_path in direct_inputs + [
                whole_archive_path,
                default_library_path,
            ]:
                with open(input_path, 'wb'):
                    pass
            with open(rsp_path, 'w', encoding='utf-8') as rsp:
                rsp.write(
                    ' '.join(f'"{path}"' for path in direct_inputs)
                    + f' "/WHOLEARCHIVE:{whole_archive_path}"'
                    + ' "/DEFAULTLIB:default.lib"'
                    + f' "/LIBPATH:{library_dir}"'
                    + ' --collect-inputs-only'
                )

            self.assertTrue(
                tool_wrapper.WinTool()._EdgeHandleCollectInputsOnly(
                    (
                        'lld-link.exe',
                        f'/OUT:{output_path}',
                        f'@{rsp_path}',
                    )
                )
            )

            with open(output_path, encoding='utf-8') as output:
                self.assertEqual(
                    [
                        tool_wrapper.EDGE_LINKER_INPUTS_HEADER,
                        *direct_inputs,
                        whole_archive_path,
                        os.path.relpath(default_library_path),
                    ],
                    output.read().splitlines(),
                )


if __name__ == '__main__':
    unittest.main()
