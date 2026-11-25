-- Threat: !InfrastructureShared
-- Name: 84b3c49b0b08
-- Type: 21
-- Includes: BMLuaLib

if not IsNoisyWebProc() then
  return mp.INFECTED
end
return mp.CLEAN
