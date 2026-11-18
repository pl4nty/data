-- Threat: !InfrastructureShared
-- Name: 129d788d3ddd6
-- Type: 21

local l_0_0 = mp.GetScannedPPID()
if not l_0_0 then
  return mp.CLEAN
end
local l_0_1 = mp.GetProcessCommandLine(l_0_0)
if not l_0_1 or #l_0_1 <= 10 then
  return mp.CLEAN
end
local l_0_2 = " -u [a-zA-Z0-9]{1,25}:[a-zA-Z0-9]{1,25}"
if MpCommon.StringRegExpSearch(l_0_2, l_0_1) == true then
  return mp.LOWFI
end
return mp.CLEAN
