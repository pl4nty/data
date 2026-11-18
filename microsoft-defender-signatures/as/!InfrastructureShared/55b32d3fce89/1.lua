-- Threat: !InfrastructureShared
-- Name: 55b32d3fce89
-- Type: 21
-- Includes: TechniqueTracker

local l_0_0 = bm.get_current_process_startup_info()
local l_0_1 = string.lower(l_0_0.command_line)
if string.find(l_0_1, "\\program files", 1, true) or string.find(l_0_1, "\\netlogon\\", 1, true) or string.find(l_0_1, "\\sysvol\\", 1, true) or string.find(l_0_1, "/nologo ", 1, true) then
  return mp.CLEAN
end
local l_0_2 = GetTaintLevelHR()
if l_0_2 == nil or l_0_2 ~= "Medium" and l_0_2 ~= "High" then
  return mp.CLEAN
end
if IsDetectionThresholdMet("BM") and (IsTacticObservedForPid("BM", "processinjection_target") or IsTacticObservedForPid("BM", "discovery")) then
  return mp.INFECTED
end
return mp.CLEAN
