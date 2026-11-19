-- Threat: !InfrastructureShared
-- Name: 41d7b432e247
-- Type: 21

local l_0_0 = mp.GetScannedPPID()
if l_0_0 == "" or l_0_0 == nil then
  return mp.CLEAN
end
local l_0_1 = string.lower(mp.GetProcessCommandLine(l_0_0))
local l_0_2 = "net\\s+use\\s+(?<drive>\\w):\\s+\\\\\\\\\\w{2,5}\\.si@ssl\\\\\\w{1,3}"
local l_0_3 = false
l_0_3, _ = MpCommon.StringRegExpSearch(l_0_2, l_0_1)
if l_0_3 == false then
  return mp.CLEAN
end
return mp.INFECTED
