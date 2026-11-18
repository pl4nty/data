-- Threat: !InfrastructureShared
-- Name: 84b3b6d8343c
-- Type: 21
-- Includes: BMLuaLib, TechniqueTracker

if IsTaintedProcessinParentTreeForLinux("upx_file_created_taint") or IsTaintedProcessinParentTreeForLinux("remote_file_created_taint") or IsTaintedProcessinParentTreeForLinux("masqueraded_file_extension_taint") then
  addRelatedProcess()
  reportRelatedBmHits()
  TrackPidAndTechniqueBM("BM", "T1074", "Collection_DataStaged_StagedArchiveExfil")
  TrackPidAndTechniqueBM("BM", "T1048", "Exfiltration_ExfiltrationOverAlternativeProtocol_StagedArchiveExfil")
  return mp.INFECTED
end
return mp.CLEAN
