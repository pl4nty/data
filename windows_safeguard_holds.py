"""Track Windows feature update safeguard holds.

Microsoft ships safeguard holds ("GatedBlock" entries) inside the Windows
Compatibility Appraiser database, published as CABs on adl.windows.com. This
script finds new CABs, parses the SDB inside them natively (no Windows tools),
and keeps one JSON file per safeguard ID. Git history is the change log.

Layout (under OUT):
  cabs.json            every CAB processed, with hash and metadata
  holds.json           one-line summary per safeguard ID
  holds/<id>.json      full block definitions for one safeguard ID
  state.json           discovery progress
"""

import argparse
import concurrent.futures
import datetime as dt
import hashlib
import json
import os
import struct
import threading
import time
import uuid
import zlib
from pathlib import Path

import cabarchive
import requests

OUT = Path("windows-safeguard-holds")
BASE_URL = "http://adl.windows.com/appraiseradl"  # HTTPS cert does not cover this host
ARCHES = ("AMD64", "ARM64", "X86")
FIRST_DATE = dt.date(2020, 1, 1)  # earliest CAB seen is 2020-01-09
MAX_REVISION = 20  # observed 1-12
MAX_VARIANT = 9  # observed 1-5
RESCAN_DAYS = 14  # CABs can appear after their nominal date

# --------------------------------------------------------------------------
# SDB parsing
# --------------------------------------------------------------------------
# Tag layout: u16 tag; the high nibble is the type. Lists, strings and binary
# blobs carry a u32 size. Names below were matched against sdb2xml output.

T_NULL, T_BYTE, T_WORD, T_DWORD, T_QWORD, T_STRINGREF = 0x1000, 0x2000, 0x3000, 0x4000, 0x5000, 0x6000
T_LIST, T_STRING, T_BINARY = 0x7000, 0x8000, 0x9000
FIXED_SIZE = {T_NULL: 0, T_BYTE: 1, T_WORD: 2, T_DWORD: 4, T_QWORD: 8, T_STRINGREF: 4}

TAG_DATABASE = 0x7001
TAG_STRINGTABLE = 0x7801
TAG_STRINGTABLE_ITEM = 0x8801

TAG_NAMES = {
    0x1003: "MATCH_LOGIC_NOT",
    0x4018: "DATA_VALUETYPE",
    0x4019: "DATA_DWORD",
    0x401E: "UPTO_LINK_DATE",
    0x4021: "RUNTIME_PLATFORM",
    0x4033: "FROM_LINK_DATE",
    0x404A: "CRC_CHECKSUM",
    0x4051: "REG_VALUE_TYPE",
    0x4052: "REG_VALUE_DATA_DWORD",
    0x5001: "TIME",
    0x5002: "BIN_FILE_VERSION",
    0x5003: "BIN_PRODUCT_VERSION",
    0x5006: "UPTO_BIN_PRODUCT_VERSION",
    0x500D: "UPTO_BIN_FILE_VERSION",
    0x5012: "FROM_BIN_PRODUCT_VERSION",
    0x5013: "FROM_BIN_FILE_VERSION",
    0x501E: "SOURCE_OS_LTE",
    0x6001: "NAME",
    0x6005: "VENDOR",
    0x6006: "APP_NAME",
    0x6008: "COMMAND_LINE",
    0x6009: "COMPANY_NAME",
    0x600B: "WILDCARD_NAME",
    0x6010: "PRODUCT_NAME",
    0x6011: "PRODUCT_VERSION",
    0x6012: "FILE_DESCRIPTION",
    0x601E: "DATA_STRING",
    0x6030: "REG_VALUE_NAME",
    0x6031: "REG_VALUE_DATA_SZ",
    0x6036: "DEST_OS_GTE",
    0x6037: "DEST_OS_LT",
    0x7001: "DATABASE",
    0x7008: "MATCHING_FILE",
    0x700F: "DATA",
    0x701E: "MATCHING_DEVICE",
    0x702E: "OS_UPGRADE",
    0x7032: "MATCHING_REG",
    0x7035: "MATCHING_INFO_BLOCK",
    0x7037: "PICK_ONE",
    0x7038: "MATCH_PLUGIN",
    0x9004: "EXE_ID",
    0x9011: "APP_ID",
}

BLOCK_TAGS = {0x702E: "OS_UPGRADE", 0x7035: "MATCHING_INFO_BLOCK"}


def tag_name(tag):
    return TAG_NAMES.get(tag, f"TAG_{tag:04X}")


def decompress_sdb(raw):
    """Return a plain SDB. Appraiser ships 'zdbf': header, u32 method, u32 size, zlib stream."""
    magic = raw[8:12]
    if magic == b"sdbf":
        return raw
    if magic != b"zdbf":
        raise ValueError(f"unknown SDB magic {magic!r}")
    method, size = struct.unpack_from("<II", raw, 12)
    if method != 1:
        raise ValueError(f"unknown SDB compression method {method}")
    data = zlib.decompress(raw[20:])
    if len(data) != size or data[8:12] != b"sdbf":
        raise ValueError("SDB decompression mismatch")
    return data


class Sdb:
    def __init__(self, data):
        self.b = data
        self.top = {tag: (off, end) for tag, off, end in self.children(12, len(data))}
        self.strtab = self.top[TAG_STRINGTABLE][0]

    def children(self, off, end):
        """Yield (tag, data_offset, data_end) for each tag in [off, end)."""
        b = self.b
        while off < end:
            (tag,) = struct.unpack_from("<H", b, off)
            off += 2
            kind = tag & 0xF000
            if kind in FIXED_SIZE:
                size = FIXED_SIZE[kind]
            elif kind in (T_LIST, T_STRING, T_BINARY):
                (size,) = struct.unpack_from("<I", b, off)
                off += 4
            else:
                raise ValueError(f"bad tag {tag:#06x} at {off - 2:#x}")
            yield tag, off, off + size
            off += size

    def _strtab_item(self, pos):
        if pos + 6 > len(self.b):
            return None
        tag, size = struct.unpack_from("<HI", self.b, pos)
        if tag != TAG_STRINGTABLE_ITEM:
            return None
        return self.b[pos + 6 : pos + 6 + size].decode("utf-16le").rstrip("\0")

    def stringref(self, ref):
        # Most refs point at the item header; some point at its string data.
        pos = self.strtab + ref
        s = self._strtab_item(pos)
        if s is None:
            s = self._strtab_item(pos - 6)
        if s is None:
            raise ValueError(f"unresolved string ref {ref:#x}")
        return s

    def value(self, tag, off, end):
        kind = tag & 0xF000
        raw = self.b[off:end]
        name = tag_name(tag)
        if kind == T_NULL:
            return True
        if kind == T_STRINGREF:
            return self.stringref(struct.unpack("<I", raw)[0])
        if kind == T_STRING:
            return raw.decode("utf-16le").rstrip("\0")
        if kind == T_LIST:
            return self.list(off, end)
        if kind == T_BINARY:
            if len(raw) == 16 and name.endswith("_ID"):
                return "{%s}" % uuid.UUID(bytes_le=raw)
            return raw.hex()
        n = int.from_bytes(raw, "little")
        if kind == T_QWORD and name.endswith("_VERSION"):
            return ".".join(str((n >> s) & 0xFFFF) for s in (48, 32, 16, 0))
        if name.endswith("_LINK_DATE"):
            return dt.datetime.fromtimestamp(n, dt.timezone.utc).strftime("%Y-%m-%dT%H:%M:%SZ")
        if name == "TIME":
            return filetime(n)
        return n

    def list(self, off, end):
        """Decode a list as a dict. A repeated child name maps to a list of values."""
        out = {}
        for tag, o, e in self.children(off, end):
            out.setdefault(tag_name(tag), []).append(self.value(tag, o, e))
        return {k: v[0] if len(v) == 1 else v for k, v in out.items()}

    def database(self):
        """Yield (tag, off, end) for each DATABASE child."""
        off, end = self.top[TAG_DATABASE]
        yield from self.children(off, end)


def filetime(n):
    t = dt.datetime(1601, 1, 1, tzinfo=dt.timezone.utc) + dt.timedelta(microseconds=n // 10)
    return t.strftime("%Y-%m-%dT%H:%M:%SZ")


def as_list(v):
    return v if isinstance(v, list) else [] if v is None else [v]


# --------------------------------------------------------------------------
# CAB -> safeguard holds
# --------------------------------------------------------------------------


def parse_cab(raw):
    """Return (metadata, {exe_id: block}) for one appraiser CAB."""
    cab = cabarchive.CabArchive(raw)
    files = {name.lower(): f.buf for name, f in cab.items()}
    sdb = Sdb(decompress_sdb(files["appraiser.sdb"]))

    meta = {}
    ini = files.get("appraiser_data.ini", b"").decode("utf-8-sig", "replace")
    for line in ini.splitlines():
        if line.startswith("AppraiserDataVersion="):
            meta["data_version"] = int(line.split("=", 1)[1])
            break
    blocks = {}
    for tag, o, e in sdb.database():
        if tag_name(tag) == "TIME":
            meta["sdb_time"] = sdb.value(tag, o, e)
        if tag not in BLOCK_TAGS:
            continue
        entry = sdb.list(o, e)
        data = {d.get("NAME"): d.get("DATA_STRING") for d in as_list(entry.get("DATA"))}
        if data.get("AppraiserData") != "GatedBlock" or not data.get("AppraiserData_GatedBlockId"):
            continue
        blocks[entry["EXE_ID"]] = {
            "id": data["AppraiserData_GatedBlockId"],
            "kind": BLOCK_TAGS[tag],
            "entry": entry,
        }
    meta["holds"] = len({b["id"] for b in blocks.values()})
    return meta, blocks


def unknown_tags(obj, found=None):
    found = set() if found is None else found
    if isinstance(obj, dict):
        for k, v in obj.items():
            if k.startswith("TAG_"):
                found.add(k)
            unknown_tags(v, found)
    elif isinstance(obj, list):
        for v in obj:
            unknown_tags(v, found)
    return found


# --------------------------------------------------------------------------
# Discovery
# --------------------------------------------------------------------------
# CAB names are YYYY_MM_DD_RR_VV_ARCH.cab: one revision RR per release date,
# variants VV numbered from 1. Probe RR_01 for AMD64, then walk VV and arches.

_local = threading.local()


def session():
    """One requests.Session per thread."""
    if not hasattr(_local, "s"):
        _local.s = requests.Session()
        # Akamai reports a compressed Content-Length otherwise
        _local.s.headers["Accept-Encoding"] = "identity"
    return _local.s


def cab_url(name):
    return f"{BASE_URL}/{name}.cab"


def head(name, retries=4):
    for attempt in range(retries):
        try:
            r = session().head(cab_url(name), timeout=30)
            if r.status_code == 404:
                return None
            if r.status_code == 200:
                return {
                    "etag": r.headers.get("ETag", "").strip('"'),
                    "size": int(r.headers.get("Content-Length", 0)),
                    "last_modified": r.headers.get("Last-Modified"),
                }
            err = f"HTTP {r.status_code}"
        except requests.RequestException as e:
            err = str(e)
        time.sleep(2 ** attempt)
    raise RuntimeError(f"HEAD {name}: {err}")


def probe_date(day):
    """Return {cab_name: head_info} for every CAB published under one date."""
    found = {}
    prefix = day.strftime("%Y_%m_%d")
    for rev in range(1, MAX_REVISION + 1):
        if not head(f"{prefix}_{rev:02d}_01_AMD64"):
            continue
        for var in range(1, MAX_VARIANT + 1):
            hits = {f"{prefix}_{rev:02d}_{var:02d}_{a}": None for a in ARCHES}
            for name in hits:
                hits[name] = head(name)
            hits = {k: v for k, v in hits.items() if v}
            if not hits:
                break
            found.update(hits)
    return found


def discover(start, end, deadline, workers=8):
    """Probe dates in [start, end]. Return (found, last date fully probed)."""
    days = [start + dt.timedelta(n) for n in range((end - start).days + 1)]
    found, done = {}, None
    with concurrent.futures.ThreadPoolExecutor(workers) as pool:
        for i in range(0, len(days), workers * 4):
            if time.monotonic() > deadline:
                break
            chunk = days[i : i + workers * 4]
            try:
                for hits in pool.map(probe_date, chunk):
                    found.update(hits)
            except RuntimeError as e:  # keep what is done; resume from `done` next run
                print(f"::warning::discovery stopped: {e}")
                break
            done = chunk[-1]
    return found, done


# --------------------------------------------------------------------------
# State
# --------------------------------------------------------------------------


def load_json(path, default):
    try:
        with open(path, encoding="utf-8") as f:
            return json.load(f)
    except FileNotFoundError:
        return default


def dump_json(path, obj):
    path.parent.mkdir(parents=True, exist_ok=True)
    with open(path, "w", encoding="utf-8", newline="\n") as f:
        json.dump(obj, f, indent=2, sort_keys=True, ensure_ascii=False)
        f.write("\n")


def release_of(cab):
    """'2025_06_19_04_01_AMD64' -> '2025_06_19_04'."""
    return cab[:13]


def cab_arch(cab):
    return cab.rsplit("_", 1)[1]


def cab_date(cab):
    return dt.datetime.strptime(cab[:10], "%Y_%m_%d").date().isoformat()


def merge(holds, cab, blocks):
    """Record that every block in `blocks` was present in `cab`."""
    arch = cab_arch(cab)
    for exe_id, b in blocks.items():
        hold = holds.setdefault(b["id"], {"id": b["id"], "blocks": {}})
        rec = hold["blocks"].setdefault(exe_id, {"kind": b["kind"], "seen": {}})
        seen = rec["seen"].setdefault(arch, {"first": cab, "last": cab})
        seen["first"] = min(seen["first"], cab)
        if cab >= seen["last"]:
            seen["last"] = cab
        if cab >= rec.get("source", ""):
            rec.update(kind=b["kind"], entry=b["entry"], source=cab)


def summarise(hold, latest):
    """One-line view of a hold. `latest` maps arch -> newest processed release."""
    blocks = hold["blocks"].values()
    seen = [(a, s) for b in blocks for a, s in b["seen"].items()]
    active = sorted({a for a, s in seen if release_of(s["last"]) == latest.get(a)})
    entries = [b["entry"] for b in blocks]
    return {
        "id": hold["id"],
        "app": sorted({e.get("APP_NAME", "") for e in entries} - {""}),
        "vendor": sorted({e.get("VENDOR", "") for e in entries} - {""}),
        "dest_os": sorted({f"{e.get('DEST_OS_GTE', '')}..{e.get('DEST_OS_LT', '')}" for e in entries}),
        "arch": sorted({a for a, _ in seen}),
        "active": active,
        "first_seen": cab_date(min(s["first"] for _, s in seen)),
        "last_seen": cab_date(max(s["last"] for _, s in seen)),
        "blocks": len(hold["blocks"]),
    }


# --------------------------------------------------------------------------
# Main
# --------------------------------------------------------------------------


def fetch(name, expected):
    r = session().get(cab_url(name), timeout=120)
    r.raise_for_status()
    raw = r.content
    if expected.get("size") and len(raw) != expected["size"]:
        raise RuntimeError(f"{name}: got {len(raw)} bytes, expected {expected['size']}")
    return raw


def main():
    ap = argparse.ArgumentParser(description=__doc__, formatter_class=argparse.RawDescriptionHelpFormatter)
    ap.add_argument("--out", type=Path, default=OUT)
    ap.add_argument("--budget", type=float, default=float(os.environ.get("SAFEGUARD_BUDGET_MINUTES", 45)),
                    help="minutes to spend before saving and stopping (resumes next run)")
    ap.add_argument("--since", type=dt.date.fromisoformat, help="probe from this date instead of saved state")
    ap.add_argument("--until", type=dt.date.fromisoformat, help="probe up to this date (default: today, UTC)")
    ap.add_argument("--cab", action="append", default=[], help="process this CAB name without probing")
    args = ap.parse_args()

    deadline = time.monotonic() + args.budget * 60
    out = args.out
    state = load_json(out / "state.json", {})
    cabs = load_json(out / "cabs.json", {})
    holds = {p.stem: load_json(p, None) for p in sorted((out / "holds").glob("*.json"))}

    # 1. discover
    if args.cab:
        found = {name: head(name) or {} for name in args.cab}
    else:
        today = args.until or dt.datetime.now(dt.timezone.utc).date()
        if args.since:
            start = args.since
        elif state.get("probed_through"):
            start = dt.date.fromisoformat(state["probed_through"]) - dt.timedelta(RESCAN_DAYS)
        else:
            start = FIRST_DATE
        found, done = discover(max(start, FIRST_DATE), today, deadline)
        if done and not args.since and not args.until:
            state["probed_through"] = max(done.isoformat(), state.get("probed_through", ""))
        print(f"probed {start}..{done}: {len(found)} CABs")

    # CABs found but not yet processed survive a spent budget via state["pending"]
    found = {**state.get("pending", {}), **found}
    todo = sorted(n for n, h in found.items() if n not in cabs or (h and cabs[n].get("etag") != h.get("etag")))
    print(f"{len(todo)} new or changed CABs")

    # 2. process whole releases, oldest first, so 'active' never reflects half a release
    unknown, failed, processed = set(), [], set()
    releases = {}
    for name in todo:
        releases.setdefault(release_of(name), []).append(name)
    for release in sorted(releases):
        if time.monotonic() > deadline:
            print("time budget spent; resuming next run")
            break
        for name in releases[release]:
            try:
                raw = fetch(name, found[name])
                meta, blocks = parse_cab(raw)
            except Exception as e:  # one bad CAB must not block the rest; retried next run
                print(f"::error::{name}: {e}")
                failed.append(name)
                continue
            merge(holds, name, blocks)
            processed.add(name)
            unknown |= unknown_tags([b["entry"] for b in blocks.values()])
            cabs[name] = {**found[name], **meta, "url": cab_url(name), "sha256": hashlib.sha256(raw).hexdigest()}
            print(f"{name}: data v{meta.get('data_version')}, {meta['holds']} holds")

    # 3. write
    state["pending"] = {n: found[n] for n in todo if n not in processed}
    latest = {}
    for name in cabs:
        a = cab_arch(name)
        latest[a] = max(latest.get(a, ""), release_of(name))
    for hid, hold in holds.items():
        dump_json(out / "holds" / f"{hid}.json", hold)
    summary = sorted((summarise(h, latest) for h in holds.values()), key=lambda s: int(s["id"]))
    dump_json(out / "holds.json", summary)
    dump_json(out / "cabs.json", cabs)
    dump_json(out / "state.json", state)
    print(f"{len(summary)} holds, {sum(1 for s in summary if s['active'])} active")
    if unknown:
        print(f"::warning::unnamed SDB tags: {', '.join(sorted(unknown))}")
    if failed:
        raise SystemExit(f"{len(failed)} CABs failed")


if __name__ == "__main__":
    main()
