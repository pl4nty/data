-- Threat: !InfrastructureShared
-- Name: 84b35ae66cdc
-- Type: 21
-- Includes: BMLuaLib

if not IsNoisyWebProc() then
  return mp.INFECTED
end
return mp.CLEAN
