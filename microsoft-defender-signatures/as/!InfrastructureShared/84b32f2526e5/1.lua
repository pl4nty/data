-- Threat: !InfrastructureShared
-- Name: 84b32f2526e5
-- Type: 21
-- Includes: LuaFuncHelper

local l_0_0 = GetRollingQueueAsHashTable("TEAMS_CALL_PLACED")
if l_0_0 and next(l_0_0) then
  local l_0_1 = {}
  l_0_1.TEAMS_Meetings = l_0_0
  l_0_1.Recent_Detections = GetRollingQueueAsHashTable("RecentThreatsOnMachine")
  local l_0_2 = safeJsonSerialize(l_0_1)
  bm.add_related_string("Evidence", l_0_2, bm.RelatedStringBMReport)
  return mp.INFECTED
end
return mp.CLEAN
