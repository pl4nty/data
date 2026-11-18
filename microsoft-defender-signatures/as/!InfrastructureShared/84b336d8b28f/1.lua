-- Threat: !InfrastructureShared
-- Name: 84b336d8b28f
-- Type: 21
-- Includes: BMLuaLib

if not IsNoisyWebProc() then
  return mp.INFECTED
end
return mp.CLEAN
