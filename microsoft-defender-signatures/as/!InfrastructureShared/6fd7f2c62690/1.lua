-- Threat: !InfrastructureShared
-- Name: 6fd7f2c62690
-- Type: 21

local l_0_0 = mp.GetScannedPPID()
if not l_0_0 then
  return mp.CLEAN
end
local l_0_1 = mp.GetProcessCommandLine(l_0_0)
if l_0_1 == nil then
  return mp.CLEAN
end
if not l_0_1 or #l_0_1 <= 60 then
  return mp.CLEAN
end
l_0_1 = string.gsub(string.lower(l_0_1), "`", "")
if string.find(l_0_1, "pipeclient", 1, true) and string.find(l_0_1, "pipewriter", 1, true) then
  return mp.INFECTED
end
return mp.CLEAN
