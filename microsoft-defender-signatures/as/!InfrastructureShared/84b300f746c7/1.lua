-- Threat: !InfrastructureShared
-- Name: 84b300f746c7
-- Type: 21
-- Includes: BMLuaLib

if not IsNoisyWebProc() then
  return mp.INFECTED
end
return mp.CLEAN
