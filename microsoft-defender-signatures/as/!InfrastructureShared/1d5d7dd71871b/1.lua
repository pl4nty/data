-- Threat: !InfrastructureShared
-- Name: 1d5d7dd71871b
-- Type: 21
-- Includes: TechniqueTracker

local l_0_0 = {"node.exe"}
if IsProcNameInParentProcessTree("cmdhstr", l_0_0) then
  return mp.INFECTED
end
return mp.CLEAN
