-- Threat: !InfrastructureShared
-- Name: b7d74d18c929
-- Type: 21
-- Includes: TechniqueTracker

local l_0_0 = {
  "advancedrun.exe"
}
if IsProcNameInParentProcessTree("cmdhstr", l_0_0) then
  return mp.INFECTED
end
return mp.CLEAN
