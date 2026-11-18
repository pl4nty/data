-- Threat: !InfrastructureShared
-- Name: 25b36933b73c
-- Type: 21
-- Includes: TechniqueTracker

local l_0_0, l_0_1 = bm.get_process_relationships()
for l_0_2, l_0_3 in ipairs(l_0_1) do
  if mp.bitand(l_0_3.reason_ex, 1) == 1 then
    TrackPidAndTechniqueBM(l_0_3.ppid, "T1105", "CommandAndControl", 120)
  end
end
return mp.CLEAN
