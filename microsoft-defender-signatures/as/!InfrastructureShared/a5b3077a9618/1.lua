-- Threat: !InfrastructureShared
-- Name: a5b3077a9618
-- Type: 21
-- Includes: TechniqueTracker

local l_0_0 = GetTechniquesTableForPid("BM")
local l_0_1 = GetTacticsTableForPid("BM")
if l_0_1 ~= nil and l_0_0 ~= nil then
  local l_0_2, l_0_3 = bm.get_process_relationships()
  for l_0_4, l_0_5 in ipairs(l_0_3) do
    for l_0_6, l_0_7 in pairs(l_0_1) do
      AddTacticForPid(l_0_5.ppid, l_0_6)
    end
    for l_0_8, l_0_9 in pairs(l_0_0) do
      AddTechniqueForPid(l_0_5.ppid, l_0_8)
    end
    TrackPidAndTechniqueBM(l_0_5.ppid, "tt_to_child", "tt_to_child")
  end
end
return mp.INFECTED
