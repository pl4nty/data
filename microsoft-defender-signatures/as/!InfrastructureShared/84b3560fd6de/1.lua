-- Threat: !InfrastructureShared
-- Name: 84b3560fd6de
-- Type: 21
-- Includes: BMLuaLib

if not IsNoisyWebProc() then
  return mp.INFECTED
end
return mp.CLEAN
