-- Threat: !InfrastructureShared
-- Name: 92d737328131
-- Type: 21
-- Includes: TechniqueTracker

local l_0_0 = {
  "sqlservr.exe"
}
if IsProcNameInParentProcessTree("cmdhstr", l_0_0) then
  return mp.INFECTED
end
return mp.CLEAN
