-- Threat: !InfrastructureShared
-- Name: eed7bc4cee14
-- Type: 21

local l_0_0 = mp.GetScannedPPID()
if type(l_0_0) ~= "string" or l_0_0 == "" then
  return mp.CLEAN
end
local l_0_1 = mp.GetProcessCommandLine(l_0_0)
if type(l_0_1) ~= "string" or l_0_1 == "" then
  return mp.CLEAN
end
local l_0_2 = "(?i)(?:^|[^a-z0-9_])art[0-9]+"
local l_0_3 = MpCommon.StringRegExpSearch(l_0_2, l_0_1)
if l_0_3 then
  return mp.INFECTED
end
return mp.CLEAN
