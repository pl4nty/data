-- Threat: !InfrastructureShared
-- Name: 126d74d95a4c6
-- Type: 21
-- Includes: TechniqueTracker

local l_0_0 = {"node.exe", "busybox"}
if IsProcNameInParentProcessTree("cmdhstr", l_0_0) then
  return mp.INFECTED
end
return mp.CLEAN
