-- Threat: !InfrastructureShared
-- Name: 84b33e71e507
-- Type: 21
-- Includes: BMLuaLib

if not IsNoisyWebProc() then
  return mp.INFECTED
end
return mp.CLEAN
