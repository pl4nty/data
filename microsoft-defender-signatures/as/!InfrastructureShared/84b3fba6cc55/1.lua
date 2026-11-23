-- Threat: !InfrastructureShared
-- Name: 84b3fba6cc55
-- Type: 21
-- Includes: BMLuaLib

if not IsNoisyWebProc() then
  return mp.INFECTED
end
return mp.CLEAN
