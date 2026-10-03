#!/usr/bin/env python3
# Copyright (C) Microsoft Corporation. All rights reserved.
# Use of this source code is governed by a BSD-style license that can be
# found in the LICENSE file.

import os
import tempfile
import unittest
from unittest import mock

import configure_siso


class EdgeConfigureSisoTest(unittest.TestCase):

    @mock.patch.object(configure_siso.sys, "platform", "win32")
    def test_main_installs_config_for_edge_instance(self):
        with tempfile.TemporaryDirectory() as temp_dir:
            backend = os.path.join(temp_dir, "backend.star")
            environment = os.path.join(temp_dir, ".sisoenv")
            reclient_configs = os.path.join(temp_dir, "reclient_cfgs")
            google_backend = os.path.join(
                configure_siso.THIS_DIR,
                "backend_config",
                "google.star",
            )
            argv = [
                "configure_siso.py",
                "--reapi_instance",
                "msRemoteExecution",
                "--reapi_address",
                "remote.example:443",
                "--reapi_backend_config_path",
                google_backend,
            ]

            with (
                mock.patch.object(configure_siso, "_BACKEND_STAR", backend),
                mock.patch.object(configure_siso, "SISO_ENV", environment),
                mock.patch.object(
                    configure_siso, "_RECLIENT_CFG_DIR", reclient_configs
                ),
                mock.patch.object(
                    configure_siso.shutil, "which", return_value=None
                ),
                mock.patch.object(configure_siso.sys, "argv", argv),
            ):
                self.assertEqual(0, configure_siso.main())

            config = os.path.join(
                reclient_configs,
                "chromium-browser-clang",
                "rewrapper_windows.cfg",
            )
            self.assertTrue(os.path.isfile(config))

    def test_recognizes_fully_qualified_edge_instance(self):
        self.assertTrue(
            configure_siso.edge_use_rewrapper_config(
                "projects/msRemoteExecution/instances/msRemoteExecution"
            )
        )
        self.assertFalse(
            configure_siso.edge_use_rewrapper_config("rbe-chromium-untrusted")
        )

    @mock.patch.object(configure_siso.sys, "platform", "linux")
    def test_skips_linux_config(self):
        with tempfile.TemporaryDirectory() as output_dir:
            configure_siso.edge_install_rewrapper_cfg("", output_dir)

            self.assertEqual([], os.listdir(output_dir))

    @mock.patch.object(configure_siso.sys, "platform", "win32")
    def test_installs_windows_config(self):
        with tempfile.TemporaryDirectory() as output_dir:
            config = os.path.join(
                output_dir,
                "chromium-browser-clang",
                "rewrapper_windows.cfg",
            )
            os.makedirs(os.path.dirname(config))
            with open(config, "w", encoding="utf-8") as config_file:
                config_file.write("stale")

            configure_siso.edge_install_rewrapper_cfg("", output_dir)

            with open(config, encoding="utf-8") as config_file:
                contents = config_file.read()

        self.assertNotIn("stale", contents)
        self.assertNotIn("${clang_revision}", contents)
        self.assertNotIn("${cipd_version}", contents)
        self.assertIn(
            "llvm_version=" + configure_siso.edge_clang_revision(), contents
        )
        self.assertIn(
            "cipd_version="
            + configure_siso.edge_cipd_version("linux-amd64"),
            contents,
        )
        self.assertIn("TargetOS=Windows", contents)
        self.assertIn("OSFamily=Linux", contents)

    @mock.patch.object(configure_siso.sys, "platform", "darwin")
    def test_installs_mac_linux_worker_config(self):
        with tempfile.TemporaryDirectory() as output_dir:
            configure_siso.edge_install_rewrapper_cfg(
                "remotebuildexecution.example:443", output_dir
            )

            config = os.path.join(
                output_dir,
                "chromium-browser-clang",
                "rewrapper_mac.cfg",
            )
            with open(config, encoding="utf-8") as config_file:
                contents = config_file.read()

        self.assertIn("TargetOS=Darwin", contents)
        self.assertIn("OSFamily=Linux", contents)

    @mock.patch.object(configure_siso.sys, "platform", "darwin")
    def test_installs_mac_darwin_worker_config(self):
        with tempfile.TemporaryDirectory() as output_dir:
            configure_siso.edge_install_rewrapper_cfg(
                "rbe.re-official.example:443", output_dir
            )

            config = os.path.join(
                output_dir,
                "chromium-browser-clang",
                "rewrapper_mac.cfg",
            )
            with open(config, encoding="utf-8") as config_file:
                contents = config_file.read()

        self.assertIn("TargetOS=Darwin", contents)
        self.assertIn("OSFamily=Darwin", contents)


if __name__ == "__main__":
    unittest.main()
