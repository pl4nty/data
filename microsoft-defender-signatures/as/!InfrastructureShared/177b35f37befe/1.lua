-- Threat: !InfrastructureShared
-- Name: 177b35f37befe
-- Type: 21
-- Includes: BMLuaLib, LuaFuncHelper, TechniqueTracker

local l_0_0 = "SearchHijackIgfxtray"
local l_0_1 = this_sigattrlog[5].utf8p1
local l_0_2 = this_sigattrlog[6].utf8p1
if isnull(l_0_1) or isnull(l_0_2) then
  return mp.CLEAN
end
l_0_1 = mp.ContextualExpandEnvironmentVariables(MpCommon.PathToWin32Path(l_0_1) or "")
l_0_2 = mp.ContextualExpandEnvironmentVariables(MpCommon.PathToWin32Path(l_0_2) or "")
if isnull(l_0_1) or isnull(l_0_2) then
  return mp.CLEAN
end
local l_0_3 = string.match(string.lower(l_0_1), "(.+)\\igfxtray.exe")
local l_0_4 = string.match(string.lower(l_0_2), "(.+)\\hccutils.dll")
if isnull(l_0_3) or isnull(l_0_4) or l_0_3 ~= l_0_4 then
  return mp.CLEAN
end
bm.add_threat_file(l_0_2)
bm.add_related_string(l_0_0, safeJsonSerialize({Process = l_0_1, Module = l_0_2}), bm.RelatedStringBMReport)
local l_0_5 = bm.get_current_process_startup_info()
if l_0_5 and l_0_5.ppid then
  TrackPidAndTechniqueBM(l_0_5.ppid, "T1574.001", "evasion_searchhijack_igfxtray")
end
return mp.INFECTED
