-- Threat: !InfrastructureShared
-- Name: b5d705180bd2
-- Type: 21

local l_0_0 = mp.GetScannedPPID()
if not l_0_0 then
  return mp.CLEAN
end
local l_0_1 = mp.GetProcessCommandLine(l_0_0)
if l_0_1 and #l_0_1 <= 400 then
  return mp.INFECTED
end
return mp.CLEAN
