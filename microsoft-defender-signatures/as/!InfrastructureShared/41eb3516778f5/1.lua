-- Threat: !InfrastructureShared
-- Name: 41eb3516778f5
-- Type: 21
-- Includes: BMLuaLib, TechniqueTracker

local l_0_0 = bm.get_current_process_startup_info()
if l_0_0 == nil or l_0_0.ppid == nil then
  return mp.CLEAN
end
if isParentPackageManager(l_0_0.ppid, true) then
  return mp.CLEAN
end
local l_0_1, l_0_2 = bm.get_process_relationships()
for l_0_3, l_0_4 in ipairs(l_0_2) do
  bm.trigger_sig("BmTraverseTreeBlock", "Detected", l_0_4.ppid)
end
TrackPidAndTechniqueBM("BM", "T1485", "Impact_DataDestruction_10dd")
local l_0_5 = bm.get_imagepath()
if l_0_5 ~= "" and l_0_5 ~= nil and check_common_process_linux(l_0_5) == false then
  bm.add_threat_file(l_0_5)
end
return mp.INFECTED
