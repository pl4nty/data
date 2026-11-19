-- Threat: !InfrastructureShared
-- Name: a0b34896d1b5
-- Type: 21
-- Includes: BMLuaLib, TechniqueTracker

local l_0_0 = bm.get_current_process_startup_info()
if l_0_0 == nil or l_0_0.ppid == nil then
  return mp.CLEAN
end
if isParentPackageManager(l_0_0.ppid, true) then
  return mp.CLEAN
end
TrackPidAndTechniqueBM("BM", "T1489", "Impact_ServiceStop_Virsh")
addRelatedProcess()
reportRelatedBmHits()
if IsTaintedProcessinParentTreeForLinux("upx_file_created_taint") or IsTaintedProcessinParentTreeForLinux("remote_file_created_taint") or IsTaintedProcessinParentTreeForLinux("masqueraded_file_extension_taint") or IsTaintedProcessinParentTreeForLinux("mounted_file_execution") then
  return mp.INFECTED
end
return mp.CLEAN
