"""Extract and decompile the Lua scripts in the Microsoft Defender signature databases.

mpam-fe.exe -> mp{as,av}{base,dlta}.vdm -> inflate -> apply delta -> Lua records
-> stock Lua 5.1 bytecode with inferred local variables -> unluac -> recompile and compare
-> microsoft-defender-signatures/{as,av}

Microsoft strips the scripts, and neither luadec nor unluac recovers local variables reliably
without debug information. microsoft_defender_lua_locals rebuilds that information, unluac
decompiles with it, and the result is kept only if stock Lua compiles it back to the original
bytecode. Scripts that fail the check get unluac's register-level output instead, marked as a
fallback.

Requires `7z`, `java` (11+) and `lua5.1` on PATH.

References:
  https://github.com/commial/experiments/tree/master/windows-defender
  https://github.com/hongson11698/defender-database-extract
  https://github.com/hfiref0x/WDExtract
"""
import hashlib
import os
import re
import shutil
import struct
import subprocess
import sys
import tempfile
import urllib.request
import zlib
from collections import Counter

import microsoft_defender_lua_locals as lua_locals

PACKAGE_URL = "https://go.microsoft.com/fwlink/?LinkID=121721&arch=x64"
UNLUAC_URL = "https://downloads.sourceforge.net/project/unluac/Unstable/unluac_2025_12_23.jar"
UNLUAC_SHA256 = "98be0fa84ac73ca66dce2842a2e4512226f4c611b6500dc96415571fc5538fcc"
OUT_DIR = os.path.join(os.path.dirname(os.path.abspath(__file__)), "microsoft-defender-signatures")

FALLBACK_NOTE = b"-- Fallback: local variables were not recovered, registers are shown instead\n\n"

SIG_THREAT_BEGIN = 0x5C
SIG_THREAT_END = 0x5D
SIG_LUASTANDALONE = 0xBD

# MpEngine checks that every chunk carries exactly this header. It claims an 8-byte size_t, but
# strings and the source name are serialised with 4-byte lengths, and lua_Number is an int64.
MP_LUA_HEADER = b"\x1bLuaQ\x00\x01\x04\x08\x04\x08\x01"

# The Ob*Attributes metadata values are stored with a byte substitution. This is the decode table,
# found in mpengine.dll 1.1.26100.4 (.rdata, 256 bytes, the copy that maps 0x00 to 0x00).
OB_TABLE = bytes.fromhex(
    "00baa3c0464384eda8973f7217adef54ddf9216442f18c49687677fc11b274d3"
    "dc040996d40df619fb357e9fd1e19dccdb63f53094407cf35dc7aae4e614676e"
    "d837a2b056a651dfb98539159e8d3e22cefe7a0ac17d9c93b313082a0c3d0682"
    "609bbd05c4241e50e5014f1cf48a982ccd3c5e6d328f2b472f1da5bb25b8d7b1"
    "659158c9be92e88b3355128eeaabf8261f711b52cbe2e786ae6231fdaf02d20e"
    "b7e3834816cfd579030fdab56f4d7bde079ad9a0c827a1d0c310bff76118eb38"
    "28a95f66c50b95535b4bf07f81f26ad678731aac89a4fa4436b475c223bc59e9"
    "29ca5a416b34704ceeb66c873a5780a799ec69ffe0c64a3b4e205c2d45882e90"
)

# Runs every chunk through unluac in one JVM. Launching the jar once per script costs ~0.3s each,
# which is hours for ~67k scripts. Reads chunk paths and writes <path minus "c"> for each.
UNLUAC_DRIVER = r"""
import java.io.*;
import java.nio.charset.StandardCharsets;
import java.nio.file.*;
import unluac.Configuration;
import unluac.Main;

public class Batch {
  public static void main(String[] args) throws Exception {
    Configuration config = new Configuration();
    for (String in : Files.readAllLines(Paths.get(args[0]), StandardCharsets.UTF_8)) {
      String out = in.substring(0, in.length() - 1);
      try {
        Main.decompile(in, out, config);
      } catch (Throwable t) {
        new File(out).delete();
        Files.write(Paths.get(out + ".err"), String.valueOf(t).getBytes(StandardCharsets.UTF_8));
      }
    }
  }
}
"""

# Recompiles every decompiled script in one Lua process. string.dump keeps debug information,
# which compare() ignores.
RECOMPILE = r"""
for path in io.lines(arg[1]) do
  local chunk = loadfile(path)
  if chunk then
    local out = assert(io.open(path .. ".bin", "wb"))
    out:write(string.dump(chunk))
    out:close()
  end
end
"""


def run(*cmd):
    print("+", " ".join(cmd), flush=True)
    subprocess.run(cmd, check=True)


def download(url, path, sha256=None):
    request = urllib.request.Request(url, headers={"User-Agent": "curl/8"})
    digest = hashlib.sha256()
    with urllib.request.urlopen(request) as response, open(path, "wb") as f:
        while chunk := response.read(1 << 20):
            digest.update(chunk)
            f.write(chunk)
    if sha256 and digest.hexdigest() != sha256:
        raise RuntimeError(f"{url}: sha256 {digest.hexdigest()}, expected {sha256}")


def unpack_vdm(path):
    """A .vdm is a PE whose resource holds an RMDX header and a raw deflate stream."""
    with open(path, "rb") as f:
        data = f.read()
    start = data.find(b"RMDX")
    while start >= 0:
        offset, unpacked_size = struct.unpack_from("<II", data, start + 0x18)
        body = start + offset
        if 0 < offset and body + 8 <= len(data):
            (packed_size,) = struct.unpack_from("<I", data, body)
            try:
                raw = zlib.decompress(data[body + 8 : body + 8 + packed_size], -15)
            except zlib.error:
                raw = b""
            if len(raw) == unpacked_size:
                return raw
        start = data.find(b"RMDX", start + 1)
    raise RuntimeError(f"{path}: no RMDX container")


def entries(buf):
    """Yield (type, payload offset, payload size) for each signature record."""
    pos = 0
    while pos + 4 <= len(buf):
        size = int.from_bytes(buf[pos + 1 : pos + 4], "little")
        yield buf[pos], pos + 4, size
        pos += 4 + size


def apply_delta(base, delta):
    """The second record of a delta database is a copy/insert script against the base."""
    records = entries(delta)
    next(records)
    _, offset, size = next(records)
    merged_size, merged_crc = struct.unpack_from("<II", delta, offset)
    script = memoryview(delta)[offset + 8 : offset + size]
    out = bytearray()
    pos = 0
    while pos < len(script):
        (op,) = struct.unpack_from("<H", script, pos)
        pos += 2
        if op & 0x8000:
            (source,) = struct.unpack_from("<I", script, pos)
            pos += 4
            out += base[source : source + (op & 0x7FFF) + 6]
        else:
            out += script[pos : pos + op]
            pos += op
    if len(out) != merged_size or zlib.crc32(out) ^ 0xFFFFFFFF != merged_crc:
        raise RuntimeError("delta merge does not match the size/CRC in the delta header")
    return bytes(out)


def lua_records(buf):
    """Yield (threat, name, type, metadata, chunk) for each Lua record.

    Record payload: u8 name size, u8 type, u16 metadata size, u32 chunk size, then the
    NUL-terminated name, the metadata ("key\\0value\\0"... "\\0") and the chunk.
    """
    threat = b""
    for kind, offset, size in entries(buf):
        if kind == SIG_THREAT_BEGIN:
            (name_size,) = struct.unpack_from("<H", buf, offset + 0xA)
            threat = buf[offset + 0xC : offset + 0xC + name_size]
        elif kind == SIG_THREAT_END:
            threat = b""
        elif kind == SIG_LUASTANDALONE:
            name_size, lua_type, meta_size, chunk_size = struct.unpack_from("<BBHI", buf, offset)
            if 8 + name_size + meta_size + chunk_size != size:
                raise RuntimeError(f"unexpected Lua record layout at {offset:#x}")
            name_end = offset + 8 + name_size
            fields = buf[name_end : name_end + meta_size].split(b"\0")
            meta = list(zip(fields[0:-2:2], fields[1:-2:2]))
            chunk = buf[name_end + meta_size : offset + size]
            yield threat, buf[offset + 8 : name_end].rstrip(b"\0"), lua_type, meta, chunk


class Reader:
    def __init__(self, data, pos, size_t, number):
        self.data = data
        self.pos = pos
        self.size_t = size_t
        self.number = number

    def unpack(self, fmt):
        values = struct.unpack_from(fmt, self.data, self.pos)
        self.pos += struct.calcsize(fmt)
        return values

    def take(self, size):
        if self.pos + size > len(self.data):
            raise ValueError("truncated chunk")
        self.pos += size
        return self.data[self.pos - size : self.pos]

    def string(self):
        return self.take(self.unpack(self.size_t)[0])


def read_function(r):
    f = {"source": r.string()}
    f["lines"] = r.unpack("<II")
    f["flags"] = r.take(4)  # upvalues, parameters, vararg, stack size
    f["code"] = r.take(4 * r.unpack("<I")[0])
    f["constants"] = constants = []
    for _ in range(r.unpack("<I")[0]):
        (kind,) = r.unpack("<B")
        if kind == 0:
            constants.append(None)
        elif kind == 1:
            constants.append(r.unpack("<?")[0])
        elif kind == 3:
            constants.append(r.unpack(r.number)[0])
        elif kind == 4:
            constants.append(r.string())
        else:
            raise ValueError(f"constant type {kind}")
    f["functions"] = [read_function(r) for _ in range(r.unpack("<I")[0])]
    # Debug information. Stripped from all but a few of Microsoft's test scripts.
    f["lineinfo"] = r.take(4 * r.unpack("<I")[0])
    f["locals"] = [(r.string(), *r.unpack("<II")) for _ in range(r.unpack("<I")[0])]
    f["upvalues"] = [r.string() for _ in range(r.unpack("<I")[0])]
    return f


def read_mp_chunk(chunk):
    if not chunk.startswith(MP_LUA_HEADER):
        raise ValueError("not an MpEngine Lua chunk")
    reader = Reader(chunk, len(MP_LUA_HEADER), "<I", "<q")
    function = read_function(reader)
    if reader.pos != len(chunk):
        raise ValueError("trailing data after chunk")
    return function


def write_function(f, out, debug):
    def string(value):
        out.append(struct.pack("<Q", len(value)) + value)

    string(f["source"] if debug else b"")
    out.append(struct.pack("<II", *f["lines"]) + f["flags"])
    out.append(struct.pack("<I", len(f["code"]) // 4) + f["code"])
    out.append(struct.pack("<I", len(f["constants"])))
    for constant in f["constants"]:
        if constant is None:
            out.append(b"\x00")
        elif isinstance(constant, bool):
            out.append(struct.pack("<B?", 1, constant))
        elif isinstance(constant, int):
            out.append(struct.pack("<Bq", 3, constant))
        else:
            out.append(b"\x04")
            string(constant)
    out.append(struct.pack("<I", len(f["functions"])))
    for function in f["functions"]:
        write_function(function, out, debug)
    lineinfo, variables, upvalues = (f["lineinfo"], f["locals"], f["upvalues"]) if debug else (b"", [], [])
    out.append(struct.pack("<I", len(lineinfo) // 4) + lineinfo)
    out.append(struct.pack("<I", len(variables)))
    for name, startpc, endpc in variables:
        string(name)
        out.append(struct.pack("<II", startpc, endpc))
    out.append(struct.pack("<I", len(upvalues)))
    for name in upvalues:
        string(name)


def stock_chunk(function, debug):
    """Serialise with the 8-byte size_t that the header promises.

    The integral lua_Number flag is kept, so int64 constants beyond 2^53 survive.
    """
    out = [MP_LUA_HEADER]
    write_function(function, out, debug)
    return b"".join(out)


def code_of(f):
    """Everything that defines behaviour, without debug information."""
    # MpEngine numbers are int64 and stock ones are doubles; True must not equal 1.
    constants = tuple((type(c) is bool, float(c) if type(c) is int else c) for c in f["constants"])
    return f["flags"], f["code"], constants, tuple(code_of(g) for g in f["functions"])


def recompiles_to(function, dump_path):
    """Did stock Lua compile the decompiled source back to the same bytecode?"""
    try:
        with open(dump_path, "rb") as f:
            dump = f.read()
        recompiled = read_function(Reader(dump, 12, "<Q", "<d"))
    except (OSError, ValueError, struct.error):
        return False
    return code_of(recompiled) == code_of(function)


def text(value):
    return value.decode("latin-1").encode("ascii", "backslashreplace").decode()


def path_part(value):
    """Same sanitisation as the previous pipeline, so existing paths stay put."""
    printable = "".join(chr(c) if 0x20 <= c < 0x7F else "_" for c in value)
    return "".join(c for c in printable if c not in '"|%:/,.\\[]<>*?')


def header(threat, name, lua_type, meta):
    lines = [f"-- Threat: {text(threat)}"]
    if name:
        lines.append(f"-- Name: {text(name)}")
    lines.append(f"-- Type: {lua_type}")
    for key, value in meta:
        key = text(key)
        if key.startswith("Ob"):
            # A boolean expression over attribute names: & | ! ( )
            key, value = key[2:], value.translate(OB_TABLE)
            value = re.sub(rb"[&|]", lambda m: b" " + m.group() + b" ", value)
        lines.append(f"-- {key}: {text(value).replace(',', ', ')}")
    return "\n".join(lines) + "\n\n"


def extract(db, vdm_dir):
    """Returns [(parsed chunk, output path, header)] for one database."""
    merged = apply_delta(
        unpack_vdm(os.path.join(vdm_dir, f"mp{db}base.vdm")),
        unpack_vdm(os.path.join(vdm_dir, f"mp{db}dlta.vdm")),
    )
    scripts = []
    counts = Counter()
    folders = {}
    for threat, name, lua_type, meta, chunk in lua_records(merged):
        if not chunk.startswith(b"\x1bLua"):
            counts["not Lua"] += 1  # a handful of records carry binary tables instead
            continue
        parts = [path_part(threat)] + ([path_part(name)] if name else [])
        # Paths that differ only by case would collide on Windows and macOS checkouts.
        key = "/".join(parts).lower()
        folder = folders.setdefault(key, os.path.join(*parts))
        counts[key] += 1
        output = os.path.join(db, folder, f"{counts[key]:x}.lua")
        scripts.append((read_mp_chunk(chunk), output, header(threat, name, lua_type, meta)))
    print(f"{db}: {len(scripts)} scripts, {counts['not Lua']} non-Lua records skipped", flush=True)
    return scripts


def unluac(jar, work_dir, chunks):
    """Decompile {path: chunk bytes}; each result lands next to its chunk as .lua."""
    listing = os.path.join(work_dir, "chunks.txt")
    with open(listing, "w", encoding="utf-8") as f:
        for path, chunk in chunks.items():
            with open(path, "wb") as g:
                g.write(chunk)
            f.write(path + "\n")
    driver = os.path.join(work_dir, "Batch.java")
    with open(driver, "w", encoding="utf-8") as f:
        f.write(UNLUAC_DRIVER)
    run("java", "-Xss64m", "-cp", jar, driver, listing)


def decompile(scripts, jar, work_dir):
    """Returns the source of each script and how many needed the fallback."""
    # Pass 1: with inferred debug information, kept only if it recompiles to the same bytecode.
    chunks = {}
    for i, (function, _, _) in enumerate(scripts):
        if not function["lineinfo"]:
            try:
                lua_locals.annotate(function)
            except lua_locals.Inconsistent:
                continue
        chunks[os.path.join(work_dir, f"{i}.luac")] = stock_chunk(function, debug=True)
    unluac(jar, work_dir, chunks)
    listing = os.path.join(work_dir, "sources.txt")
    with open(listing, "w", encoding="utf-8") as f:
        f.writelines(path[:-1] + "\n" for path in chunks if os.path.exists(path[:-1]))
    recompile = os.path.join(work_dir, "recompile.lua")
    with open(recompile, "w", encoding="utf-8") as f:
        f.write(RECOMPILE)
    run("lua5.1", recompile, listing)

    sources = {}
    for i, (function, _, _) in enumerate(scripts):
        path = os.path.join(work_dir, f"{i}.lua")
        if recompiles_to(function, path + ".bin"):
            with open(path, "rb") as f:
                sources[i] = f.read()

    # Pass 2: unluac's own handling of stripped code, which names every register.
    chunks = {
        os.path.join(work_dir, f"{i}.raw.luac"): stock_chunk(function, debug=False)
        for i, (function, _, _) in enumerate(scripts) if i not in sources
    }
    fallbacks = len(chunks)
    if chunks:
        unluac(jar, work_dir, chunks)
    for i in range(len(scripts)):
        if i not in sources:
            path = os.path.join(work_dir, f"{i}.raw.lua")
            try:
                with open(path, "rb") as f:
                    sources[i] = FALLBACK_NOTE + f.read()
            except OSError:
                with open(path + ".err", "rb") as f:
                    sources[i] = b"-- unluac failed: " + f.read().splitlines()[0] + b"\n"
    return sources, fallbacks


def main():
    work_dir = tempfile.mkdtemp(prefix="mpam-")
    package = os.path.join(work_dir, "mpam-fe.exe")
    vdm_dir = os.path.join(work_dir, "mpam-fe")
    jar = os.path.join(work_dir, "unluac.jar")
    download(PACKAGE_URL, package)
    run("7z", "x", "-y", "-bso0", package, f"-o{vdm_dir}", "*.vdm")
    download(UNLUAC_URL, jar, UNLUAC_SHA256)

    scripts = extract("as", vdm_dir) + extract("av", vdm_dir)
    sources, fallbacks = decompile(scripts, jar, work_dir)
    print(f"{len(scripts) - fallbacks} of {len(scripts)} scripts recompile to identical bytecode, "
          f"{fallbacks} use the fallback")
    # Do not replace good data with the output of a broken run.
    if not scripts or fallbacks * 20 > len(scripts):
        sys.exit("too many fallbacks, keeping the existing output")

    staging = os.path.join(work_dir, "out")
    for i, (_, output, head) in enumerate(scripts):
        path = os.path.join(staging, output)
        os.makedirs(os.path.dirname(path), exist_ok=True)
        with open(path, "wb") as f:
            f.write(head.encode() + sources[i])
    for db in ("as", "av"):
        shutil.rmtree(os.path.join(OUT_DIR, db), ignore_errors=True)
        shutil.move(os.path.join(staging, db), os.path.join(OUT_DIR, db))
    shutil.rmtree(work_dir, ignore_errors=True)


if __name__ == "__main__":
    main()
