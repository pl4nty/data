-- Threat: !InfrastructureShared
-- Name: ffb344421ff5
-- Type: 21
-- Includes: BMLuaLib

if not IsNoisyWebProc() then
  return mp.INFECTED
end
return mp.CLEAN
