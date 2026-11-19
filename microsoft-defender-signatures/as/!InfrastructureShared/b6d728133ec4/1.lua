-- Threat: !InfrastructureShared
-- Name: b6d728133ec4
-- Type: 21

local l_0_0 = mp.GetScannedPPID()
if l_0_0 == nil then
  return mp.CLEAN
end
local l_0_1 = mp.GetProcessCommandLine(l_0_0)
if l_0_1 == nil then
  return mp.CLEAN
end
l_0_1 = string.lower(l_0_1)
local l_0_2 = "\\\\exclusions\\\\paths\\\\*['\"\\s]+\\/v['\"\\s]+(?:c:\\\\+programdata\\\\*|%programdata%)(?:[\\s'\"]+|$)"
local l_0_3, l_0_4 = MpCommon.StringRegExpSearch(l_0_2, l_0_1)
if l_0_3 then
  return mp.INFECTED
end
return mp.CLEAN
