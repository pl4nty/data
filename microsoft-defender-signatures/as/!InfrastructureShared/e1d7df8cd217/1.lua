-- Threat: !InfrastructureShared
-- Name: e1d7df8cd217
-- Type: 21
-- Includes: TechniqueTracker

local l_0_0 = mp.GetScannedPPID()
if l_0_0 == nil then
  return mp.CLEAN
end
local l_0_1 = mp.GetProcessCommandLine(l_0_0)
if l_0_1 ~= "notepad.exe" then
  return mp.CLEAN
end
local l_0_2 = GetRealPidForScenario("CMDHSTR")
if IsTacticObservedForPid(l_0_2, "possible_sb_proc_for_injection") then
  return mp.INFECTED
end
return mp.CLEAN
