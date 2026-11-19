-- Threat: !InfrastructureShared
-- Name: 32b3ffa19f9f
-- Type: 21
-- Includes: BMLuaLib, LuaFuncHelper

local l_0_0 = bm.get_current_process_startup_info()
if not l_0_0 or not l_0_0.ppid then
  return mp.CLEAN
end
bm.trigger_sig("RMMprocess_Started", "")
local l_0_1 = MpCommon.QuerySessionInformation(l_0_0.ppid, MpCommon.WTSIsRemoteSession)
if not l_0_1 then
  return mp.CLEAN
end
local l_0_2 = GetRollingQueueKeyValues("TEAMS_Download", "RMMTool")
if not l_0_2 or not next(l_0_2) then
  return mp.CLEAN
end
if MpCommon.QueryPersistContextNoPath("RMMDownloadedFromTeams", "on") then
  bm.add_related_string("RMMDownloadedFromTeams", "true", bm.RelatedStringBMReport)
end
local l_0_3 = GetRollingQueueKeyValues("TEAMS_Download", "ClickedLink")
bm.add_related_string("RMMTools", safeJsonSerialize(l_0_2), bm.RelatedStringBMReport)
bm.add_related_string("TeamsUrls", safeJsonSerialize(l_0_3), bm.RelatedStringBMReport)
reportSessionInformationInclusive()
add_parents()
return mp.INFECTED
