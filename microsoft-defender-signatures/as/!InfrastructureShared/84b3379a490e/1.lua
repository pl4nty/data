-- Threat: !InfrastructureShared
-- Name: 84b3379a490e
-- Type: 21
-- Includes: BMLuaLib

if not IsNoisyWebProc() then
  return mp.INFECTED
end
return mp.CLEAN
