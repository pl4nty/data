-- Threat: !InfrastructureShared
-- Name: 84b31f2e0f7c
-- Type: 21
-- Includes: BMLuaLib

if not IsNoisyWebProc() then
  return mp.INFECTED
end
return mp.CLEAN
