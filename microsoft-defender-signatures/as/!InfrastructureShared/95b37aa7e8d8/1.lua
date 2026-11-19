-- Threat: !InfrastructureShared
-- Name: 95b37aa7e8d8
-- Type: 21
-- Includes: TechniqueTracker

local l_0_0 = {
  "psexesvc.exe",
  "psexec.exe"
}
if IsProcNameInParentProcessTree("BM", l_0_0) then
  return mp.INFECTED
end
return mp.CLEAN
