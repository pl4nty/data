-- Threat: !InfrastructureShared
-- Name: 99d76dfb13a0
-- Type: 21

local l_0_0 = mp.GetScannedPPID()
if l_0_0 == "" or l_0_0 == nil then
  return mp.CLEAN
end
local l_0_1 = mp.GetProcessCommandLine(l_0_0)
l_0_1 = string.lower(l_0_1)
local l_0_2 = false
l_0_2, _ = MpCommon.StringRegExpSearch("(curl|mshta|msiexec|powershell)", l_0_1)
if l_0_2 ~= true then
  return mp.CLEAN
end
l_0_2, _ = MpCommon.StringRegExpSearch("(adobe|apple|google|microsoft)", l_0_1)
if l_0_2 ~= true then
  return mp.CLEAN
end
return mp.INFECTED
