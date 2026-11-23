-- Threat: !InfrastructureShared
-- Name: 84b31fcb7358
-- Type: 21
-- Includes: BMLuaLib

if not IsNoisyWebProc() then
  return mp.INFECTED
end
return mp.CLEAN
