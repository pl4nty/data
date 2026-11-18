-- Threat: !InfrastructureShared
-- Name: 219b368c59079
-- Type: 21
-- Includes: BMLuaLib, TechniqueTracker

if IsTaintedProcessinParentTreeForLinux("upx_file_created_taint") or IsTaintedProcessinParentTreeForLinux("remote_file_created_taint") or IsTaintedProcessinParentTreeForLinux("masqueraded_file_extension_taint") then
  addRelatedProcess()
  reportRelatedBmHits()
  TrackPidAndTechniqueBM("BM", "T1048", "Exfiltration_ExfiltrationOverAlternativeProtocol_StagedSenitiveDataExfil")
  return mp.INFECTED
end
return mp.CLEAN
