-- Threat: !InfrastructureShared
-- Name: 97d7b61ffe91
-- Type: 21
-- Includes: TechniqueTracker

local l_0_0 = {
  "nslookup.exe"
}
if IsProcNameInParentProcessTree("cmdhstr", l_0_0) then
  return mp.INFECTED
end
return mp.CLEAN
