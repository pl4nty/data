# Windows safeguard holds

Built by [`windows_safeguard_holds.py`](../windows_safeguard_holds.py) from the Windows Compatibility Appraiser CABs on `adl.windows.com`. Git history is the change log.

| File | Content |
| --- | --- |
| `holds.json` | One summary per safeguard ID: app, vendor, target OS range, architectures, first/last seen, `active` architectures |
| `holds/<id>.json` | Every block for the ID, keyed by `EXE_ID`: full match rules (`entry`), and the first/last CAB it appeared in per architecture (`seen`) |
| `cabs.json` | Every CAB processed: URL, ETag, size, SHA-256, appraiser data version, SDB timestamp, hold count |
| `state.json` | Discovery progress (`probed_through`) and CABs found but not yet processed (`pending`) |

A hold is `active` for an architecture when it is in that architecture's newest processed release.

## Method

- **Discovery**: CAB names are `YYYY_MM_DD_RR_VV_ARCH.cab`, one revision `RR` per release date, variants `VV` from 1. Each date is probed with HEAD for `RR_01_AMD64`; on a hit, variants and `AMD64`/`ARM64`/`X86` are walked. Each run re-probes the last 14 days.
- **Parsing**: `appraiser.sdb` is a `zdbf` container (u32 method, u32 size, zlib). The SDB tag tree is parsed natively. Tag names were matched against `sdb2xml` output; tags without a known name appear as `TAG_XXXX`.
- **Selection**: `OS_UPGRADE` and `MATCHING_INFO_BLOCK` entries whose `DATA` has `AppraiserData=GatedBlock` and an `AppraiserData_GatedBlockId`.
- **Integrity**: the host serves no valid HTTPS certificate, so CABs are fetched over HTTP. Size is checked against the HEAD response and the SHA-256 is recorded; signatures are not verified.

Each run stops after a time budget (`SAFEGUARD_BUDGET_MINUTES`, default 45) and resumes on the next run, so the first backfill can take several runs.
