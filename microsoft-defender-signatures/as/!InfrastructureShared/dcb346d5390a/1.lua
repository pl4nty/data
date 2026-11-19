-- Threat: !InfrastructureShared
-- Name: dcb346d5390a
-- Type: 21
-- Includes: BMLuaLib, LuaFuncHelper, TechniqueTracker

-- Fallback: decompiled by unluac-rs, not verified against the original bytecode

local r0_0 = "PrintProcessor"
local r0_1 = string.match(this_sigattrlog[3].utf8p1 or "", "%\\([^%\\]+)%\\%\\")
local r0_2 = this_sigattrlog[3].utf8p2
if not isnull(r0_1) and not isnull(r0_2) then
  local r0_3 = string.find(r0_2, "\\", 1, true) and r0_2
    or string.format("C:\\Windows\\System32\\spool\\prtprocs\\x64\\%s", r0_2)
  local r0_4 = GetRollingQueueKeyValue("SuspiciousDLL.PrtProc.Exports", string.lower(r0_3))
  if isnull(r0_4) then
    return mp.CLEAN
  end
  local r0_5, r0_6, r0_7 = string.match(r0_4 or "", "Count=(%d+)_List=(.+)_MissingReq=(%d+)")
  if r0_5 and r0_6 and r0_7 and tonumber(r0_5) ~= 0 then
    bm.add_threat_file(r0_3)
    bm.add_related_string(r0_0,
      safeJsonSerialize({
          DriverName = r0_1, DriverFile = r0_2, DriverPath = r0_3, ExpCount = r0_5 or -1,
          ExpList = r0_6 or "?", ExpMissing = r0_7 or -1
        }),
      bm.RelatedStringBMReport)
    local r0_8 = bm.get_current_process_startup_info()
    if r0_8 and r0_8.ppid then
      TrackPidAndTechniqueBM(r0_8.ppid, "T1547.012", "persist_printprocessor_driver")
    end
    return mp.INFECTED
  end
  return mp.CLEAN
end
return mp.CLEAN
