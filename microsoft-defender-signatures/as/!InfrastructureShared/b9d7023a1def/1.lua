-- Threat: !InfrastructureShared
-- Name: b9d7023a1def
-- Type: 21
-- Includes: TechniqueTracker

local l_0_0 = {"node.exe"}
if IsProcNameInParentProcessTree("cmdhstr", l_0_0) then
  return mp.INFECTED
end
return mp.CLEAN
