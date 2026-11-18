-- Threat: !InfrastructureShared
-- Name: 51d7ec51d1eb
-- Type: 21

local l_0_0 = mp.GetScannedPPID()
if not l_0_0 then
  return mp.CLEAN
end
local l_0_1 = mp.GetProcessCommandLine(l_0_0)
if not l_0_1 or #l_0_1 <= 10 then
  return mp.CLEAN
end
if 450 < #l_0_1 then
  return mp.CLEAN
end
local l_0_2 = string.match(l_0_1, "[eE][cC][hH][oO]%s+([A-Za-z0-9+/=]+)%s*|")
if l_0_2 == nil then
  return mp.CLEAN
end
local l_0_3 = MpCommon.Base64Decode(l_0_2)
if l_0_3 == nil then
  return mp.CLEAN
end
l_0_3 = string.lower(l_0_3)
if string.find(l_0_3, "bash -i", 1, true) and string.find(l_0_3, "/dev/tcp/", 1, true) then
  return mp.INFECTED
end
return mp.CLEAN
