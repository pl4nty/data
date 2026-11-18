-- Threat: !InfrastructureShared
-- Name: 84b38ae8b2a5
-- Type: 21
-- Includes: BMLuaLib

if not IsNoisyWebProc() then
  return mp.INFECTED
end
return mp.CLEAN
