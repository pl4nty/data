-- Threat: !InfrastructureShared
-- Name: 4bd722fbe491
-- Type: 21
-- Includes: TechniqueTracker

local l_0_0 = {
  "regsvcs.exe"
}
if IsProcNameInParentProcessTree("cmdhstr", l_0_0) then
  return mp.INFECTED
end
return mp.CLEAN
