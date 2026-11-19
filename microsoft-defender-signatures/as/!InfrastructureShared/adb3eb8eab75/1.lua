-- Threat: !InfrastructureShared
-- Name: adb3eb8eab75
-- Type: 21
-- Includes: TechniqueTracker

TrackPidAndTechniqueBM("BM", "T1098.004", "Persistence")
local l_0_0, l_0_1 = bm.get_process_relationships()
for l_0_2, l_0_3 in ipairs(l_0_0) do
  if mp.bitand(l_0_3.reason_ex, 1) == 1 then
    bm.add_related_process(l_0_3.ppid)
    TrackPidAndTechniqueBM(l_0_3.ppid, "T1098.004", "Persistence")
  end
end
return mp.INFECTED
