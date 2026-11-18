-- Threat: !InfrastructureShared
-- Name: 84b36fe66790
-- Type: 21
-- Includes: BMLuaLib, TechniqueTracker

local l_0_0 = bm.get_imagepath()
if l_0_0 ~= nil and l_0_0 ~= "" and (IsTaintedProcessinParentTreeForLinux("upx_file_created_taint") or IsTaintedProcessinParentTreeForLinux("remote_file_created_taint") or IsTaintedProcessinParentTreeForLinux("masqueraded_file_extension_taint") or IsTaintedProcessinParentTreeForLinux("mounted_file_execution")) then
  addRelatedProcess()
  reportRelatedBmHits()
  TrackPidAndTechniqueBM("BM", "T1020", "Exfiltration_AutomatedExfiltration_AsymmetricEncryptedNonC2Protocol")
  return mp.INFECTED
end
return mp.CLEAN
