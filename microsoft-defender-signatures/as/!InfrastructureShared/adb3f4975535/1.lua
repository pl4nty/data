-- Threat: !InfrastructureShared
-- Name: adb3f4975535
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
