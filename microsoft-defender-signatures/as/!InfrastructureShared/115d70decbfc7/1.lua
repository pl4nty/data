-- Threat: !InfrastructureShared
-- Name: 115d70decbfc7
-- Type: 21

local l_0_0 = mp.GetScannedPPID()
if l_0_0 == nil then
  return mp.CLEAN
end
local l_0_1 = string.lower(mp.GetProcessCommandLine(l_0_0))
if l_0_1 == nil then
  return mp.CLEAN
end
if string.find(l_0_1, "sdelete", 1, true) or string.find(l_0_1, "procdump", 1, true) or string.find(l_0_1, "psshutdown", 1, true) then
  return mp.CLEAN
end
return mp.INFECTED
