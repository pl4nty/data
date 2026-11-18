-- Threat: !InfrastructureShared
-- Name: 4db33f0d7667
-- Type: 21
-- Includes: TechniqueTracker

local l_0_0, l_0_1 = bm.get_process_relationships()
for l_0_2, l_0_3 in ipairs(l_0_0) do
  if l_0_3.image_path ~= nil and string.lower(string.sub(l_0_3.image_path, -4)) == "sshd" then
    TrackPidAndTechniqueBM("BM", "T1078.001", "InitialAccess_RootAccess")
    TrackPidAndTechniqueBM("BM", "T1078.001", "Persistence_RootAccess")
    return mp.INFECTED
  end
end
return mp.CLEAN
