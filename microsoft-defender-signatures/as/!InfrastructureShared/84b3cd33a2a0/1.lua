-- Threat: !InfrastructureShared
-- Name: 84b3cd33a2a0
-- Type: 21
-- Includes: BMLuaLib

if not IsNoisyWebProc() then
  return mp.INFECTED
end
return mp.CLEAN
