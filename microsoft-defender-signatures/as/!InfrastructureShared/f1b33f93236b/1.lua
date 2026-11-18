-- Threat: !InfrastructureShared
-- Name: f1b33f93236b
-- Type: 21
-- Includes: BMLuaLib, TechniqueTracker, LuaFuncHelper

local l_0_0, l_0_1
if this_sigattrlog[1].matched then
  l_0_0 = "genb_linux_ransom_meta"
elseif this_sigattrlog[2].matched then
  l_0_0 = "gene_linux_ransom_meta"
elseif this_sigattrlog[3].matched then
  l_0_0 = "genh_linux_ransom_meta"
elseif this_sigattrlog[4].matched then
  l_0_0 = "genj_linux_ransom_meta"
end
if l_0_0 == nil then
  return mp.CLEAN
end
local l_0_2 = GetRollingQueueAsHashTable(l_0_0)
if l_0_2 == nil then
  return mp.CLEAN
end
l_0_1 = l_0_2.appended_ext
if l_0_1 == nil then
  return mp.CLEAN
end
if isKnownRansomExtension(l_0_1) then
  addRelatedProcess()
  TrackPidAndTechniqueBM("BM", "T1486", "Impact_FileEncryption")
  local l_0_3, l_0_4 = bm.get_process_relationships()
  for l_0_5, l_0_6 in ipairs(l_0_4) do
    bm.trigger_sig("BmTraverseTreeBlock", "Detected", l_0_6.ppid)
  end
  TerminateParentProcessForLinux()
  return mp.INFECTED
end
return mp.CLEAN
