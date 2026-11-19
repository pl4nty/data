-- Threat: !InfrastructureShared
-- Name: 97b3ff3b797e
-- Type: 21
-- Includes: TechniqueTracker

local l_0_0 = {"node"}
if IsProcNameInParentProcessTree("BM", l_0_0) then
  return mp.INFECTED
end
return mp.CLEAN
