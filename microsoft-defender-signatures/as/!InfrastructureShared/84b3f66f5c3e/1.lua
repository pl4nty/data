-- Threat: !InfrastructureShared
-- Name: 84b3f66f5c3e
-- Type: 21
-- Includes: BMLuaLib

if not IsNoisyWebProc() then
  return mp.INFECTED
end
return mp.CLEAN
