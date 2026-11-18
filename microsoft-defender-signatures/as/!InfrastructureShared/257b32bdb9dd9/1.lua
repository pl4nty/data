-- Threat: !InfrastructureShared
-- Name: 257b32bdb9dd9
-- Type: 21
-- Includes: BMLuaLib, TechniqueTracker

local l_0_0 = bm.get_current_process_startup_info()
if l_0_0 == nil or l_0_0.ppid == nil then
  return mp.CLEAN
end
if isParentPackageManager(l_0_0.ppid, true) then
  return mp.CLEAN
end
if IsTaintedProcessinParentTreeForLinux("upx_file_created_taint") or IsTaintedProcessinParentTreeForLinux("remote_file_created_taint") or IsTaintedProcessinParentTreeForLinux("masqueraded_file_extension_taint") or IsTaintedProcessinParentTreeForLinux("mounted_file_execution") or IsTaintedProcessinParentTreeForLinux("new_elf_file_created_hint") then
  AddResearchData("BM", true)
  reportRelatedBmHits()
  addRelatedProcess()
  return mp.INFECTED
end
return mp.CLEAN
