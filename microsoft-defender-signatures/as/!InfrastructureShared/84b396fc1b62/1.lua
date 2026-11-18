-- Threat: !InfrastructureShared
-- Name: 84b396fc1b62
-- Type: 21
-- Includes: BMLuaLib

if not IsNoisyWebProc() then
  return mp.INFECTED
end
return mp.CLEAN
