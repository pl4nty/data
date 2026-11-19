-- Threat: !InfrastructureShared
-- Name: 5bb3ed196636
-- Type: 21
-- Includes: TechniqueTracker

local l_0_0 = {
  "winword.exe",
  "excel.exe",
  "powerpnt.exe",
  "mspub.exe"
}
if IsProcNameInParentProcessTree("BM", l_0_0) then
  return mp.INFECTED
end
return mp.CLEAN
