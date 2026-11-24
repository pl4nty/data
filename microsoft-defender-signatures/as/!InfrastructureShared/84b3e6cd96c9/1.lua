-- Threat: !InfrastructureShared
-- Name: 84b3e6cd96c9
-- Type: 21
-- Includes: BMLuaLib

if not IsNoisyWebProc() then
  return mp.INFECTED
end
return mp.CLEAN
