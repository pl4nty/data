-- Threat: !InfrastructureShared
-- Name: 32b35c76e8df
-- Type: 21
-- Includes: TechniqueTracker, BMLuaLib

local l_0_0 = bm.get_imagepath()
if l_0_0 ~= nil and isTainted(l_0_0, "remote_file_created_taint") then
  addRelatedProcess()
  reportRelatedBmHits()
  TrackPidAndTechniqueBM("BM", "T1105", "CommandAndControl_IngressToolTransfer_SuspiciousRemoteFileExecution")
  return mp.INFECTED
end
return mp.CLEAN
