-- Threat: !InfrastructureShared
-- Name: 12bd7e8f03052
-- Type: 21
-- Includes: TechniqueTracker

local l_0_0 = {"node.exe", "bun.exe"}
if IsProcNameInParentProcessTree("cmdhstr", l_0_0) then
  return mp.INFECTED
end
return mp.CLEAN
