-- Threat: !InfrastructureShared
-- Name: 84b34c3c1b2a
-- Type: 21
-- Includes: BMLuaLib

if not IsNoisyWebProc() then
  return mp.INFECTED
end
return mp.CLEAN
