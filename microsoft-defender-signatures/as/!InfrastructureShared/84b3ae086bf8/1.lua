-- Threat: !InfrastructureShared
-- Name: 84b3ae086bf8
-- Type: 21
-- Includes: BMLuaLib

if not IsNoisyWebProc() then
  return mp.INFECTED
end
return mp.CLEAN
