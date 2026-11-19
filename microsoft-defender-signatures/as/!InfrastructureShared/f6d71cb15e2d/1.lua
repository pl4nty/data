-- Threat: !InfrastructureShared
-- Name: f6d71cb15e2d
-- Type: 21
-- Includes: TechniqueTracker

local l_0_0 = mp.GetScannedPPID()
if not l_0_0 then
  return mp.CLEAN
end
local l_0_1 = mp.GetProcessCommandLine(l_0_0)
if not l_0_1 or #l_0_1 <= 60 then
  return mp.CLEAN
end
if 450 < #l_0_1 then
  return mp.CLEAN
end
local l_0_2 = {"w3wp.exe"}
if IsProcNameInParentProcessTree("cmdhstr", l_0_2) then
  return mp.INFECTED
end
return mp.CLEAN
