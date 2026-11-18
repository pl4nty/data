-- Threat: !InfrastructureShared
-- Name: 84b3da0de539
-- Type: 21
-- Includes: BMLuaLib

if not IsNoisyWebProc() then
  return mp.INFECTED
end
return mp.CLEAN
