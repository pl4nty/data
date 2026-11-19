-- Threat: !InfrastructureShared
-- Name: 88d71ec23322
-- Type: 21
-- Includes: TechniqueTracker

local l_0_0 = {"dsr.exe"}
if IsProcNameInParentProcessTree("cmdhstr", l_0_0) then
  return mp.INFECTED
end
return mp.CLEAN
