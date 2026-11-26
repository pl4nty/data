-- Threat: !InfrastructureShared
-- Name: 84b3f51b2c42
-- Type: 21
-- Includes: BMLuaLib

if not IsNoisyWebProc() then
  return mp.INFECTED
end
return mp.CLEAN
