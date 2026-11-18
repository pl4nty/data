-- Threat: !InfrastructureShared
-- Name: 64bb36bae3b59
-- Type: 21
-- Includes: BMLuaLib, TechniqueTracker

local l_0_0
local l_0_1 = "T1204"
local l_0_2 = "Execution_UserExecution_ExactMatch"
if this_sigattrlog[17].matched or this_sigattrlog[18].matched then
  l_0_1 = "T1543.001"
  l_0_2 = "Persistence_LaunchAgent_ExactMatch"
end
if this_sigattrlog[16].matched then
  if this_sigattrlog[16].utf8p1 ~= nil and this_sigattrlog[16].utf8p1 ~= "" then
    l_0_0 = this_sigattrlog[16].utf8p1
  end
  if not string.match(l_0_0, "/DAFOM%-%d+%.%d+%.%d+%.dmg$") then
    return mp.CLEAN
  end
end
if this_sigattrlog[26].matched or this_sigattrlog[19].matched then
  if this_sigattrlog[26].utf8p1 ~= nil and this_sigattrlog[26].utf8p1 ~= "" then
    l_0_0 = this_sigattrlog[26].utf8p1
  end
  if this_sigattrlog[19].utf8p1 ~= nil and this_sigattrlog[19].utf8p1 ~= "" then
    l_0_0 = this_sigattrlog[19].utf8p1
  end
  if l_0_0 == nil or not string.match(l_0_0, "/DAFOM%-%d+%.%d+%.%d+%.app/") then
    return mp.CLEAN
  end
end
local l_0_3, l_0_4 = bm.get_process_relationships()
if l_0_4 ~= nil then
  for l_0_5, l_0_6 in ipairs(l_0_4) do
    bm.trigger_sig("BmTraverseTreeBlockMac", "Detected", l_0_6.ppid)
  end
end
if this_sigattrlog[20].matched or this_sigattrlog[21].matched or this_sigattrlog[22].matched or this_sigattrlog[23].matched or this_sigattrlog[24].matched or this_sigattrlog[25].matched or this_sigattrlog[26].matched then
  local l_0_7 = bm.get_imagepath()
  if IsExcludedByImagePathMacOS(l_0_7) then
    return mp.CLEAN
  end
  local l_0_8 = bm.get_current_process_startup_info()
  if l_0_8 == nil then
    return mp.CLEAN
  end
  local l_0_9 = l_0_8.command_line
  if IsExcludedByCmdlineMacOS(l_0_9) then
    return mp.CLEAN
  end
  if (SuspMacPathsToMonitor(l_0_7, true) or string.find(l_0_7, "/Users/[^/]+/Downloads/", 1, false) or string.find(l_0_7, "/Users/[^/]+/Documents/", 1, false) or string.find(l_0_7, "/Users/[^/]+/Desktop/", 1, false)) and sysio.IsFileExists(l_0_7) then
    bm.add_threat_file(l_0_7)
  end
end
TrackPidAndTechniqueBM("BM", l_0_1, l_0_2)
return mp.INFECTED
