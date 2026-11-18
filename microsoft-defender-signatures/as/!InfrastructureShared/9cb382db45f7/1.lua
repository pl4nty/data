-- Threat: !InfrastructureShared
-- Name: 9cb382db45f7
-- Type: 21
-- Includes: BMLuaLib, TechniqueTracker

local l_0_0
if this_sigattrlog[2].matched and this_sigattrlog[2].utf8p1 ~= nil then
  l_0_0 = string.lower(this_sigattrlog[2].utf8p1)
end
local l_0_1 = {
  "\\program files",
  "\\appdata\\local\\apps\\2.0\\",
  "icue.exe"
}
if contains(l_0_0, l_0_1) then
  return mp.CLEAN
end
local l_0_2 = {
  "winword.exe",
  "excel.exe",
  "powerpnt.exe",
  "mspub.exe",
  "wscript.exe",
  "cscript.exe",
  "mshta.exe",
  "powershell.exe",
  "pwsh.exe",
  "rundll32.exe",
  "regsvr32.exe",
  "wmic.exe",
  "wmiprvse.exe"
}
if IsProcNameInParentProcessTree("BM", l_0_2) then
  add_parents()
  return mp.INFECTED
end
return mp.CLEAN
