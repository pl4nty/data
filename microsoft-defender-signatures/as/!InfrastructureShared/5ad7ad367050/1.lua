-- Threat: !InfrastructureShared
-- Name: 5ad7ad367050
-- Type: 21
-- Includes: TechniqueTracker

local l_0_0 = {"node.exe"}
if IsProcNameInParentProcessTree("cmdhstr", l_0_0) then
  return mp.INFECTED
end
return mp.CLEAN
