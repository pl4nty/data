-- Threat: !InfrastructureShared
-- Name: 32b3d588787a
-- Type: 21
-- Includes: BMLuaLib, TechniqueTracker

if IsTaintedProcessinParentTreeForLinux("upx_file_created_taint") or IsTaintedProcessinParentTreeForLinux("remote_file_created_taint") or IsTaintedProcessinParentTreeForLinux("masqueraded_file_extension_taint") then
  addRelatedProcess()
  reportRelatedBmHits()
  TrackPidAndTechniqueBM("BM", "T1095", "CommandandControl_NonApplicationLayerProtocol_SensitiveDataExfil")
  return mp.INFECTED
end
return mp.CLEAN
