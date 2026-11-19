-- Threat: !InfrastructureShared
-- Name: 43b3ce2612cc
-- Type: 21
-- Includes: BMLuaLib

if IsTaintedProcessinParentTreeForLinux("upx_file_created_taint") or IsTaintedProcessinParentTreeForLinux("remote_file_created_taint") or IsTaintedProcessinParentTreeForLinux("masqueraded_file_extension_taint") or IsTaintedProcessinParentTreeForLinux("mounted_file_execution") then
  addRelatedProcess()
  reportRelatedBmHits()
  local l_0_0, l_0_1 = bm.get_process_relationships()
  for l_0_2, l_0_3 in ipairs(l_0_1) do
    bm.trigger_sig("BmTraverseTreeBlock", "Detected", l_0_3.ppid)
  end
  return mp.INFECTED
end
return mp.CLEAN
