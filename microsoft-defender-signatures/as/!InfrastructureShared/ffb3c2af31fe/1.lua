-- Threat: !InfrastructureShared
-- Name: ffb3c2af31fe
-- Type: 21
-- Includes: BMLuaLib

if not IsNoisyWebProc() then
  return mp.INFECTED
end
return mp.CLEAN
