-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\21eb325c67237\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = GetRollingQueueAsHashTable("TEAMS_CALL_PLACED")
if l_0_0 and next(l_0_0) then
  local l_0_1 = {}
  l_0_1.TEAMS_Meetings = l_0_0
  l_0_1.Recent_Detections = GetRollingQueue("RecentThreatsOnMachine")
  local l_0_2 = safeJsonSerialize(l_0_1)
  ;
  (bm.add_related_string)("Evidence", l_0_2, bm.RelatedStringBMReport)
  return mp.INFECTED
end
do
  return mp.CLEAN
end

