-- Threat: !InfrastructureShared
-- Name: 10bd74940a838
-- Type: 21
-- Includes: TechniqueTracker

local l_0_0 = {"w3wp.exe"}
if IsProcNameInParentProcessTree("cmdhstr", l_0_0) then
  return mp.INFECTED
end
return mp.CLEAN
