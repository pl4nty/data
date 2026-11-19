-- Threat: !InfrastructureShared
-- Name: 40d700d02b50
-- Type: 21

local l_0_0 = mp.GetScannedPPID()
if l_0_0 == "" or l_0_0 == nil then
  return mp.CLEAN
end
local l_0_1 = mp.GetProcessCommandLine(l_0_0)
if not l_0_1 then
  return mp.CLEAN
end
local l_0_2, l_0_3 = MpCommon.StringRegExpSearch("(?i)[^\\w\\d\\s]w[indowstyle]*\\s+(?:h[iden]*|1|m[inimized]*)\\s+", l_0_1)
if not l_0_2 then
  return mp.CLEAN
end
local l_0_4 = mp.GetParentProcInfo()
if l_0_4 == nil then
  return mp.CLEAN
end
local l_0_5 = l_0_4.ppid
local l_0_6 = mp.GetProcessCommandLine(l_0_5)
if l_0_6 == "" or l_0_6 == nil then
  return mp.CLEAN
end
l_0_6 = l_0_6:lower()
if string.find(l_0_6, "wscript.exe", 1, true) and string.find(l_0_6, ".js", 1, true) and string.find(l_0_6, "appdata", 1, true) then
  return mp.INFECTED
end
return mp.CLEAN
