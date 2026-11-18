-- Threat: !InfrastructureShared
-- Name: 84b39cee0f2d
-- Type: 21
-- Includes: TechniqueTracker

local l_0_0, l_0_1 = bm.get_process_relationships()
for l_0_2, l_0_3 in ipairs(l_0_0) do
  if mp.bitand(l_0_3.reason_ex, 1) == 1 then
    bm.add_related_file(l_0_3.image_path)
    bm.add_related_process(l_0_3.ppid)
    TrackPidAndTechniqueBM(l_0_3.ppid, "T1087.001", "Discovery")
    return mp.INFECTED
  end
end
return mp.CLEAN
