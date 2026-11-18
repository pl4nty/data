-- Threat: !InfrastructureShared
-- Name: 84b31d9aff63
-- Type: 21
-- Includes: BMLuaLib, TechniqueTracker

local l_0_0, l_0_1 = bm.get_process_relationships()
if l_0_1 ~= nil then
  for l_0_2, l_0_3 in ipairs(l_0_1) do
    bm.trigger_sig("BmTraverseTreeBlockMac", "Detected", l_0_3.ppid)
  end
end
if this_sigattrlog[3].matched then
  local l_0_4 = bm.get_imagepath()
  if IsExcludedByImagePathMacOS(l_0_4) then
    return mp.CLEAN
  end
  if (SuspMacPathsToMonitor(l_0_4, true) or string.find(l_0_4, "/Users/[^/]+/Downloads/", 1, false) or string.find(l_0_4, "/Users/[^/]+/Documents/", 1, false) or string.find(l_0_4, "/Users/[^/]+/Desktop/", 1, false)) and sysio.IsFileExists(l_0_4) then
    bm.add_threat_file(l_0_4)
  end
end
TrackPidAndTechniqueBM("BM", "T1204", "Execution_UserExecution_ExactMatch")
return mp.INFECTED
