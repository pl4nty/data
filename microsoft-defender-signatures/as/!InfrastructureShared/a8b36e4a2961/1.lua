-- Threat: !InfrastructureShared
-- Name: a8b36e4a2961
-- Type: 21
-- Includes: TechniqueTracker

local l_0_0 = {"w3wp.exe"}
if IsProcNameInParentProcessTree("BM", l_0_0) then
  return mp.INFECTED
end
return mp.CLEAN
