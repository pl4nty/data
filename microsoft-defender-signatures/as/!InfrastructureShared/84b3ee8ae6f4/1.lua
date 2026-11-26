-- Threat: !InfrastructureShared
-- Name: 84b3ee8ae6f4
-- Type: 21
-- Includes: BMLuaLib

if not IsNoisyWebProc() then
  return mp.INFECTED
end
return mp.CLEAN
