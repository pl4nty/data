-- Threat: !InfrastructureShared
-- Name: 84b384a48848
-- Type: 21
-- Includes: BMLuaLib

if not IsNoisyWebProc() then
  return mp.INFECTED
end
return mp.CLEAN
