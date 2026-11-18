-- Threat: !InfrastructureShared
-- Name: 89d7e4034438
-- Type: 21
-- Includes: TechniqueTracker

local l_0_0 = {"java.exe", "javaw.exe"}
if IsProcNameInParentProcessTree("cmdhstr", l_0_0) then
  return mp.LOWFI
end
return mp.CLEAN
