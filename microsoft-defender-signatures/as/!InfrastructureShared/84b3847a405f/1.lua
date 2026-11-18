-- Threat: !InfrastructureShared
-- Name: 84b3847a405f
-- Type: 21
-- Includes: BMLuaLib

if not IsNoisyWebProc() then
  return mp.INFECTED
end
return mp.CLEAN
