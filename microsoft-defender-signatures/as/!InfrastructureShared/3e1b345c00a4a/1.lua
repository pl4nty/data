-- Threat: !InfrastructureShared
-- Name: 3e1b345c00a4a
-- Type: 21
-- Includes: BMLuaLib, TechniqueTracker

local l_0_0 = bm.get_current_process_startup_info()
if l_0_0 == nil or l_0_0.ppid == nil then
  return mp.CLEAN
end
local l_0_1 = mp.GetParentProcInfo()
if l_0_1 == nil or l_0_1.ppid == nil then
  return mp.CLEAN
end
if isParentPackageManager(l_0_1.ppid, true) then
  return mp.CLEAN
end
TrackPidAndTechniqueBM("BM", "T1070.004", "DefenseEvasion_IndicatorRemoval_FileDeletion")
TrackPidAndTechniqueBM("BM", "T1485", "Impact_DataDestructionIntent")
addRelatedProcess()
reportRelatedBmHits()
local l_0_2, l_0_3 = bm.get_process_relationships()
for l_0_4, l_0_5 in ipairs(l_0_3) do
  bm.trigger_sig("BmTraverseTreeBlock", "Detected", l_0_5.ppid)
end
return mp.INFECTED
