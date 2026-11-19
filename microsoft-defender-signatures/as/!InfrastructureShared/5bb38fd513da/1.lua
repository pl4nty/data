-- Threat: !InfrastructureShared
-- Name: 5bb38fd513da
-- Type: 21
-- Includes: BMLuaLib, TechniqueTracker

local l_0_0 = bm.get_imagepath()
if l_0_0 ~= nil and isTainted(l_0_0, "remote_file_chmodexec") then
  taint(l_0_0, "susp_remotefile_execution", 3600)
  TrackPidAndTechniqueBM("BM", "T1105", "CommandAndControl_IngressToolTransfer_WWDSuspiciousRemoteFileExecution")
  addRelatedProcess()
  reportRelatedBmHits()
  local l_0_1, l_0_2 = bm.get_process_relationships()
  for l_0_3, l_0_4 in ipairs(l_0_2) do
    bm.trigger_sig("BmTraverseTreeBlock", "Detected", l_0_4.ppid)
  end
  if sysio.IsFileExists(l_0_0) then
    bm.add_threat_file(l_0_0)
  end
  return mp.INFECTED
end
return mp.CLEAN
