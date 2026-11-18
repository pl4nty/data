-- Threat: !InfrastructureShared
-- Name: cfb31c096924
-- Type: 21
-- Includes: BMLuaLib, TechniqueTracker

TrackPidAndTechniqueBM("BM", "T1552.001", "CredentialAccess")
TrackPidAndTechniqueBM("BM", "T1074", "Collection_DataStaged")
local l_0_0, l_0_1 = bm.get_process_relationships()
for l_0_2, l_0_3 in ipairs(l_0_0) do
  if mp.bitand(l_0_3.reason_ex, 1) == 1 and isTainted(l_0_3.image_path, "remote_file_created_taint") then
    addRelatedProcess()
    return mp.INFECTED
  end
end
return mp.CLEAN
