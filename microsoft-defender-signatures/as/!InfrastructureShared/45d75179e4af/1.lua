-- Threat: !InfrastructureShared
-- Name: 45d75179e4af
-- Type: 21

local l_0_0 = mp.GetScannedPPID()
if l_0_0 == "" or l_0_0 == nil then
  return mp.CLEAN
end
local l_0_1 = mp.GetProcessCommandLine(l_0_0)
if not l_0_1 then
  return mp.CLEAN
end
if 450 < #l_0_1 then
  return mp.CLEAN
end
l_0_1 = string.lower(l_0_1)
if l_0_1:match("[%w%-]+%.[%w%-]+%.[a-z][a-z]+") then
  return mp.INFECTED
end
return mp.CLEAN
