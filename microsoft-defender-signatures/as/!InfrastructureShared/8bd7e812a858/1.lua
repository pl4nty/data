-- Threat: !InfrastructureShared
-- Name: 8bd7e812a858
-- Type: 21
-- Includes: TechniqueTracker

local l_0_0 = {
  "wmiprvse.exe"
}
if IsProcNameInParentProcessTree("cmdhstr", l_0_0) then
  return mp.INFECTED
end
return mp.CLEAN
