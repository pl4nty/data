-- Threat: !InfrastructureShared
-- Name: 1054d73a2252fb
-- Type: 21

local l_0_0 = mp.GetScannedPPID()
if l_0_0 == "" or l_0_0 == nil then
  return mp.CLEAN
end
local l_0_1 = string.lower(mp.GetProcessCommandLine(l_0_0))
if not l_0_1 or #l_0_1 < 30 or 440 < #l_0_1 then
  return mp.CLEAN
end
return mp.INFECTED
