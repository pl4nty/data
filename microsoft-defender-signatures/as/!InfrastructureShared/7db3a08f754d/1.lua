-- Threat: !InfrastructureShared
-- Name: 7db3a08f754d
-- Type: 21
-- Includes: BMLuaLib, TechniqueTracker

if IsTaintedProcessinParentTreeForLinux("upx_file_created_taint") or IsTaintedProcessinParentTreeForLinux("remote_file_created_taint") or IsTaintedProcessinParentTreeForLinux("masqueraded_file_extension_taint") then
  addRelatedProcess()
  reportRelatedBmHits()
  TrackPidAndTechniqueBM("BM", "T1074", "Collection_DataStaged_StagedSensitiveFile")
  return mp.INFECTED
end
return mp.CLEAN
