-- Threat: !InfrastructureShared
-- Name: 49d7421dceaf
-- Type: 21
-- Includes: TechniqueTracker

local l_0_0 = mp.GetScannedPPID()
if not l_0_0 then
  return mp.CLEAN
end
local l_0_1 = mp.GetProcessCommandLine(l_0_0)
l_0_1 = string.lower(l_0_1)
local l_0_2 = {"w3wp.exe"}
if not IsProcNameInParentProcessTree("cmdhstr", l_0_2) then
  return mp.CLEAN
end
return mp.INFECTED
