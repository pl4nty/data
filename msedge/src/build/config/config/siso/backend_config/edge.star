# -*- bazel-starlark -*-
# Copyright (C) Microsoft Corporation. All rights reserved.
# Use of this source code is governed by a BSD-style license that can be
# found in the LICENSE file.
"""Siso backend config for Microsoft Edge."""

load("@builtin//runtime.star", "runtime")
load("@builtin//struct.star", "module")

_CLANG_UPDATE = "tools/clang/scripts/update.py"
_CIPD_DIGESTS = "third_party/depot_tools/cipd_client_version_ms.digests"
_PYTHON_VERSION = "2@3.11.8.chromium.35"

def _assignment(ctx, name):
    prefix = name + " = "
    for line in str(ctx.fs.read(_CLANG_UPDATE)).splitlines():
        if line.startswith(prefix):
            value = line.removeprefix(prefix)
            if value.startswith("'") and value.endswith("'"):
                return value[1:-1]
            return value
    fail("%s not found in %s" % (name, _CLANG_UPDATE))

def _cipd_version(ctx, platform):
    for line in str(ctx.fs.read(_CIPD_DIGESTS)).splitlines():
        fields = line.split()
        if len(fields) == 3 and fields[0] == platform:
            return fields[2]
    fail("%s not found in %s" % (platform, _CIPD_DIGESTS))

def _use_darwin_worker(ctx):
    if runtime.os != "darwin":
        return False
    address = ctx.flags.get("reapi_address", "")
    return (
        address.startswith("rbedev") or
        address.startswith("rbe.re-preprod") or
        address.startswith("rbeofficial") or
        address.startswith("rbe.re-official")
    )

def _platform_properties(ctx):
    target_os = {
        "darwin": "Darwin",
        "linux": "Linux",
        "windows": "Windows",
    }[runtime.os]
    use_darwin_worker = _use_darwin_worker(ctx)
    properties = {
        "TargetOS": target_os,
        "OSFamily": "Darwin" if use_darwin_worker else "Linux",
        "container-image": "edgeRBE",
        "llvm_version": "%s-%s" % (
            _assignment(ctx, "CLANG_REVISION_EDGE"),
            _assignment(ctx, "CLANG_SUB_REVISION_EDGE"),
        ),
        "python_version": _PYTHON_VERSION,
        "cipd_version": _cipd_version(
            ctx,
            "mac-arm64" if use_darwin_worker else "linux-amd64",
        ),
    }
    return {
        "default": properties,
        "large": dict(properties),
    }

backend = module(
    "backend",
    platform_properties = _platform_properties,
)
