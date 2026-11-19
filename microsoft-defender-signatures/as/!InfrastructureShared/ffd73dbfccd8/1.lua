-- Threat: !InfrastructureShared
-- Name: ffd73dbfccd8
-- Type: 21

local l_0_0 = mp.GetScannedPPID()
if not l_0_0 then
  return mp.CLEAN
end
local l_0_1 = mp.GetProcessCommandLine(l_0_0)
if not l_0_1 then
  return mp.CLEAN
end
if #l_0_1 < 300 then
  return mp.INFECTED
end
return mp.CLEAN
