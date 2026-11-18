-- Threat: !InfrastructureShared
-- Name: e7b3fd80ab00
-- Type: 21
-- Includes: BMLuaLib, TechniqueTracker

local l_0_0 = bm.get_imagepath()
TrackPidAndTechniqueBM("BM", "T1552.001", "CredentialAccess")
TrackPidAndTechniqueBM("BM", "T1074", "Collection_DataStaged")
addRelatedProcess()
if isTainted(l_0_0, "remote_file_created_taint") then
  return mp.INFECTED
end
return mp.CLEAN
