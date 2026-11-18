-- Threat: !InfrastructureShared
-- Name: 296b35590204c
-- Type: 21
-- Includes: BMLuaLib, TechniqueTracker

local l_0_0 = bm.get_current_process_startup_info()
if l_0_0 == nil or l_0_0.ppid == nil then
  return mp.CLEAN
end
if isParentPackageManager(l_0_0.ppid, true) then
  return mp.CLEAN
end
if IsTaintedProcessinParentTreeForLinux("upx_file_created_taint") then
  AddResearchData("BM", true)
  reportRelatedBmHits()
  addRelatedProcess()
  local l_0_1, l_0_2 = bm.get_process_relationships()
  for l_0_3, l_0_4 in ipairs(l_0_2) do
    bm.trigger_sig("BmTraverseTreeBlock", "Detected", l_0_4.ppid)
  end
  return mp.INFECTED
end
return mp.CLEAN
