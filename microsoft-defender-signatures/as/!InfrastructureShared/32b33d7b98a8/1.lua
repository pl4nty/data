-- Threat: !InfrastructureShared
-- Name: 32b33d7b98a8
-- Type: 21
-- Includes: TechniqueTracker, BMLuaLib

if IsTaintedProcessinParentTreeForLinux("upx_file_created_taint") or IsTaintedProcessinParentTreeForLinux("remote_file_created_taint") or IsTaintedProcessinParentTreeForLinux("masqueraded_file_extension_taint") or IsTaintedProcessinParentTreeForLinux("mounted_file_execution") then
  TrackPidAndTechniqueBM("BM", "T1570", "LateralMovement_LateralToolTransfer_SuspFileCreateFTP")
  addRelatedProcess()
  reportRelatedBmHits()
  return mp.INFECTED
end
return mp.CLEAN
