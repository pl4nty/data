-- Threat: !InfrastructureShared
-- Name: 84b3c46f0948
-- Type: 21
-- Includes: BMLuaLib

if not IsNoisyWebProc() then
  return mp.INFECTED
end
return mp.CLEAN
