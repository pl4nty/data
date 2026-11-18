-- Threat: !InfrastructureShared
-- Name: 5fb334d9095c
-- Type: 21
-- Includes: BMLuaLib, LuaFuncHelper, TechniqueTracker

local l_0_0 = MpCommon.PathToWin32Path(this_sigattrlog[3].utf8p1 or "")
local l_0_1 = MpCommon.PathToWin32Path(bm.get_imagepath() or "")
local l_0_2 = bm.get_current_process_startup_info()
if isnull(l_0_0) or isnull(l_0_1) or isnull(l_0_2) or isnull(l_0_2.ppid) then
  return mp.CLEAN
end
l_0_1 = mp.ContextualExpandEnvironmentVariables(l_0_1)
if isnull(l_0_1) then
  return mp.CLEAN
end
mp.IsKnownFriendlyFile(l_0_1, false, true)
local l_0_3 = mp.IsKnownFriendlyFile(l_0_1, false, true)
if l_0_3 == nil or l_0_3 == true then
  return mp.CLEAN
end
local l_0_4 = MpCommon.GetCurrentTimeT() or 0
local l_0_5 = sysio.GetFileLastWriteTime(l_0_1) or 0
if l_0_4 == 0 or l_0_5 == 0 or l_0_4 - l_0_5 / 10000000 - 11644473600 > 3600 then
  return mp.CLEAN
end
local l_0_6 = sysio.GetFileAttributes(l_0_1)
local l_0_8 = l_0_6 ~= 4294967295 and mp.bitand(l_0_6, 2) == 2
bm.add_related_file(l_0_0)
bm.add_related_string("Keylog_Metadata", safeJsonSerialize({
  ProcPath = l_0_1,
  Log = l_0_0,
  ProcHidden = l_0_8,
  ProcFileTime = l_0_5,
  Friend = l_0_3 and "yes" or "no"
}), bm.RelatedStringBMReport)
TrackPidAndTechniqueBM(l_0_2.ppid, "T1056.001", "collect_keylog")
return mp.INFECTED
