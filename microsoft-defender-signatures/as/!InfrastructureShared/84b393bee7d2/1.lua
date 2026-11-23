-- Threat: !InfrastructureShared
-- Name: 84b393bee7d2
-- Type: 21
-- Includes: BMLuaLib

if not IsNoisyWebProc() then
  return mp.INFECTED
end
return mp.CLEAN
