-- Threat: !InfrastructureShared
-- Name: 32b307b9242f
-- Type: 21
-- Includes: TechniqueTracker

local l_0_0 = {
  "wscript.exe",
  "cscript.exe"
}
if IsProcNameInParentProcessTree("BM", l_0_0) then
  return mp.INFECTED
end
return mp.CLEAN
