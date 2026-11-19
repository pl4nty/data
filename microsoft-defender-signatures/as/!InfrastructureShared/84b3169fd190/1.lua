-- Threat: !InfrastructureShared
-- Name: 84b3169fd190
-- Type: 21
-- Includes: BMLuaLib

if not IsNoisyWebProc() then
  return mp.INFECTED
end
return mp.CLEAN
