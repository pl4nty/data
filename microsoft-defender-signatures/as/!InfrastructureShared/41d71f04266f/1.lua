-- Threat: !InfrastructureShared
-- Name: 41d71f04266f
-- Type: 21

local l_0_0 = mp.GetScannedPPID()
if not l_0_0 then
  return mp.CLEAN
end
local l_0_1 = mp.GetProcessCommandLine(l_0_0)
if not l_0_1 or #l_0_1 <= 10 then
  return mp.CLEAN
end
local l_0_2 = "^[a-fA-F0-9]{32}$"
if MpCommon.StringRegExpSearch(l_0_2, l_0_1) == true then
  return mp.INFECTED
end
return mp.CLEAN
