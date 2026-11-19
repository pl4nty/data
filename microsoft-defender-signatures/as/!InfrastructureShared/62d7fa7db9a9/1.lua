-- Threat: !InfrastructureShared
-- Name: 62d7fa7db9a9
-- Type: 21
-- Includes: BMLuaLib, TechniqueTracker

local l_0_0 = mp.GetScannedPPID()
if l_0_0 == nil then
  return mp.CLEAN
end
local l_0_1 = mp.GetProcessCommandLine(l_0_0):lower()
if l_0_1 == nil then
  return mp.CLEAN
end
local l_0_2, l_0_3 = string.gsub(l_0_1, "%^", "")
if l_0_3 < 5 then
  return mp.CLEAN
end
l_0_2 = string.gsub(l_0_2, " ", "")
local l_0_4 = {
  "startmshtahttp://",
  "cmd/cmshtahttp://"
}
if not contains(l_0_2, l_0_4) then
  return mp.CLEAN
end
local l_0_5 = {
  "winword.exe",
  "excel.exe",
  "powerpnt.exe",
  "mspub.exe"
}
if IsProcNameInParentProcessTree("cmdhstr", l_0_5) then
  return mp.INFECTED
end
return mp.CLEAN
