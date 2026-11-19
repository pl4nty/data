-- Threat: !InfrastructureShared
-- Name: 7fd7fa6935b0
-- Type: 21
-- Includes: TechniqueTracker

local l_0_0 = {
  "winword.exe",
  "excel.exe",
  "powerpnt.exe",
  "mspub.exe"
}
if IsProcNameInParentProcessTree("cmdhstr", l_0_0) then
  return mp.INFECTED
end
return mp.CLEAN
