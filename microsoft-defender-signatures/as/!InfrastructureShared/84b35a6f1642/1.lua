-- Threat: !InfrastructureShared
-- Name: 84b35a6f1642
-- Type: 21
-- Includes: BMLuaLib

if not IsNoisyWebProc() then
  return mp.INFECTED
end
return mp.CLEAN
