-- Threat: !InfrastructureShared
-- Name: 84b3fe1b00f4
-- Type: 21
-- Includes: BMLuaLib

if not IsNoisyWebProc() then
  return mp.INFECTED
end
return mp.CLEAN
