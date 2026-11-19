-- Threat: !InfrastructureShared
-- Name: 7dd71be95096
-- Type: 21

local l_0_0 = mp.GetScannedPPID()
if not l_0_0 then
  return mp.CLEAN
end
local l_0_1 = mp.GetProcessCommandLine(l_0_0)
if not l_0_1 then
  return mp.CLEAN
end
if 300 <= #l_0_1 then
  return mp.CLEAN
end
local l_0_2 = l_0_1:match("/([A-Za-z0-9]+)' %-UseBasicParsing$")
if l_0_2 then
  return mp.INFECTED
end
return mp.CLEAN
